import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/responses/chatroom_response.dart';
import '../../../domain/models/chatroom.dart';
import '../../../presentation/controllers/auth_controller.dart';
import '../../../presentation/controllers/chatroom_controller.dart';
import '../../../presentation/widgets/loading_dialog.dart';

@RoutePage()
class ChatRoomScreen extends ConsumerStatefulWidget {
  const ChatRoomScreen({Key? key, required this.chatRoom}) : super(key: key);

  final ChatRoom chatRoom;

  @override
  ConsumerState<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends ConsumerState<ChatRoomScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = ref.watch(authControllerProvider)?.id;
    final valueAsync =
        ref.watch(chatRoomControllerProvider(widget.chatRoom.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatRoom.users?.map((e) => e.fullname).join(', ') ??
            'No Users'),
      ),
      body: Column(
        children: [
          Expanded(
            child: valueAsync.when(
              data: (data) => _buildList(data, currentUserId),
              error: (err, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error!',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(err.toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // TODO: reinitialize
                          ref
                              .read(
                                  chatRoomControllerProvider(widget.chatRoom.id)
                                      .notifier)
                              .getChatRoom(widget.chatRoom.id);
                        },
                        child: const Text('Try Again')),
                  ],
                ),
              ),
              loading: () => const LoadingOverlay(),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              minLines: 2,
              maxLines: 2,
              decoration: InputDecoration(
                suffix: IconButton(
                  onPressed: () {
                    // TODO: handle sending message
                  },
                  icon: const Icon(Icons.send),
                  tooltip: 'Send',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(ChatRoomResponse data, int? currentUserId) {
    final messages = data.data.messages ?? [];

    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              messages[index].content,
              textAlign: messages[index].senderId == currentUserId
                  ? TextAlign.end
                  : TextAlign.start,
            ),
          );
        });
  }
}
