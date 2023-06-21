import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/providers/dateformatter_provider.dart';
import '../../../../domain/models/chatroom.dart';
import '../../../../data/responses/responses.dart';
import '../../../../presentation/controllers/controllers.dart';
import '../../../../presentation/widgets/loading_dialog.dart';
import '../../../../presentation/widgets/logout_button.dart';
import '../../../application/app_router.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final chatsAsync = ref.watch(chatRoomsProvider);

    final currentPage = chatsAsync.value?.meta.pagination.current ?? 1;
    final lastPage = chatsAsync.value?.meta.pagination.last ?? 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        actions: const [
          LogoutButton(),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                  onPressed: currentPage > 1
                      ? () {
                          ref
                              .read(chatsRequestControllerProvider.notifier)
                              .previousPage();
                        }
                      : null,
                  icon: const Icon(Icons.chevron_left)),
              Text('$currentPage/$lastPage'),
              IconButton(
                  onPressed: currentPage < lastPage
                      ? () {
                          ref
                              .read(chatsRequestControllerProvider.notifier)
                              .nextPage();
                        }
                      : null,
                  icon: const Icon(Icons.chevron_right)),
            ],
          ),
        ),
        Expanded(
          child: chatsAsync.when(
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
        ),
      ]),
    );
  }

  Widget _buildList(ChatRoomsResponse data) {
    final chats = data.data;

    if (chats.isEmpty) {
      return Container();
    }

    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final ChatRoom chat = chats[index];
          final comment = chat.lastComment != null
              ? chat.lastComment!.comment
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
                    .format(chat.lastComment!.createdAt))
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
          FilledButton(
            onPressed: () {
              // reload chat rooms
              ref.invalidate(chatRoomsProvider);
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
