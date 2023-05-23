import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';

import '../../../data/responses/responses.dart';
import '../../../presentation/controllers/controllers.dart';
import '../../../application/app_router.dart';
import '../../../presentation/widgets/loading_dialog.dart';
import '../../../presentation/widgets/logout_button.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final chatsAsync = ref.watch(chatMessagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: chatsAsync.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildList(data),
          );
        },
        error: (error, stackTrace) {
          return _buildError(error);
        },
        loading: () {
          return const LoadingOverlay();
        },
      ),
    );
  }

  Widget _buildList(ChatRoomsResponse data) {
    final chats = data.data;

    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          final comment =
              chat.lastComment != null && chat.lastComment!.isNotEmpty
                  ? chat.lastComment!.first.comment
                  : 'NO COMMENT';

          return ListTile(
            title: Text(chat.title),
            subtitle: Text(
              comment,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black54),
            ),
            trailing: chat.lastComment != null
                ? Text(ref
                    .watch(dateFormatterProvider)
                    .format(chat.lastComment!.first.createdAt))
                : null,
            onTap: () {
              // ref.read(selectedProjectProvider.notifier).update(project);

              AutoRouter.of(context).push(PapViewRoute(uuid: chat.uuid));
            },
          );
        });
  }

  Widget _buildError(error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Error',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(error.toString()),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // reload chat rooms
              ref.read(chatsControllerProvider.notifier).get();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
