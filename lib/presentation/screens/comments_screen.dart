import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/extensions.dart';
import '../../data/repositories/newcomment_repository.dart';
import '../../data/requests/comment_request.dart';
import '../../domain/models/comment.dart';
import '../controllers/combinedcomments_controller.dart';
import '../controllers/currentuser_controller.dart';
import '../controllers/newcommentstream_controller.dart';
import '../widgets/message_bubble.dart';

@RoutePage()
class CommentsScreen extends ConsumerStatefulWidget {
  const CommentsScreen({super.key, @PathParam('uuid') required this.uuid});

  final String uuid;

  @override
  ConsumerState<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends ConsumerState<CommentsScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final Random _random = Random();

  @override
  void dispose() {
    super.dispose();

    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final liveComments = ref.watch(combinedCommentsProvider(uuid: widget.uuid));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 600,
          maxHeight: 600,
          minWidth: 300,
          maxWidth: 360,
        ),
        child: Container(
          height: 600,
          width: 360,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: liveComments.when(
                  data: (data) {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final comment = data[index];

                        return MessageBubble(comment: comment);
                      },
                    );
                  },
                  error: (error, stacktrace) {
                    return Center(
                      child: Text('Error: ${error.toString()}'),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 1,
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.send),
                  ),
                  onFieldSubmitted: (String? value) {
                    debugPrint(value);
                    if (value == null) {
                      return;
                    }
                    //

                    ref
                        .read(newCommentRepositoryProvider(uuid: widget.uuid))
                        .addComment(CommentRequest(comment: value));

                    ref
                        .read(newCommentLocalStreamControllerProvider)
                        .sink
                        .add(Comment(
                          id: 6000000 + _random.nextInt(100),
                          comment: value,
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                          isResolved: false,
                          userId: ref.watch(currentUserProvider)?.id,
                          user:
                              ref.watch(currentUserProvider)?.toQuickResource(),
                        ));

                    _textEditingController.clear();
                  },
                ),
              ),
              // Add more chat messages as needed
            ],
          ),
        ),
      ),
    );
  }
}
