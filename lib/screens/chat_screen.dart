import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpips/application/app_router.dart';
import 'package:xpips/application/functions.dart';
import 'package:xpips/data/responses/chatrooms_response.dart';
import 'package:xpips/presentation/controllers/chat_controller.dart';
import 'package:xpips/presentation/widgets/loading_dialog.dart';
import 'package:xpips/presentation/widgets/logout_button.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final valueAsync = ref.watch(chatControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: valueAsync.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildList(data),
          );
        },
        error: (error, stackTrace) {
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
                    ref.read(chatControllerProvider.notifier).getChatRooms();
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        },
        loading: () {
          return const LoadingOverlay();
        },
      ),
    );
  }

  Widget _buildList(ChatRoomsResponse data) {
    final chatRooms = data.data;

    return ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          final chatRoom = chatRooms[index];
          final lastMessageDt = chatRoom.lastMessage?.createdAt;

          return ListTile(
            title: Text(chatRoom.users?.map((e) => e.fullname).join(', ') ??
                'No Users'),
            subtitle: Text(
              chatRoom.lastMessage?.content ?? 'No message',
              style: const TextStyle(
                color: Colors.black45,
              ),
            ),
            trailing:
                lastMessageDt != null ? Text(formatDate(lastMessageDt)) : null,
            onTap: () {
              // TODO: open chat room
              AutoRouter.of(context).push(ChatRoomRoute(chatRoom: chatRoom));
            },
          );
        });
  }
}
