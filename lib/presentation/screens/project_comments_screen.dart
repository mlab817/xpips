import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';

import '../../application/extensions.dart';
import '../../data/repositories/newcomment_repository.dart';
import '../../data/requests/comment_request.dart';
import '../../domain/entities/comment.dart';
import '../controllers/combinedcomments_controller.dart';
import '../controllers/currentuser_controller.dart';
import '../controllers/newcommentstream_controller.dart';
import '../widgets/message_bubble.dart';

@RoutePage()
class ProjectCommentsScreen extends ConsumerStatefulWidget {
  const ProjectCommentsScreen(
      {super.key, @PathParam('uuid') required this.uuid});

  final String uuid;

  @override
  ConsumerState<ProjectCommentsScreen> createState() =>
      _ProjectCommentsScreenState();
}

class _ProjectCommentsScreenState extends ConsumerState<ProjectCommentsScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final Random _random = Random();

  Future<void> _addComment(String? value) async {
    if (value == null) {
      return;
    }
    //
    try {
      await ref
          .read(newCommentRepositoryProvider(uuid: widget.uuid))
          .addComment(widget.uuid, CommentRequest(comment: value));

      ref.read(newCommentLocalStreamControllerProvider).sink.add(Comment(
            id: 6000000 + _random.nextInt(100),
            comment: value,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            isResolved: false,
            userId: ref.watch(currentUserProvider)?.id,
            user: ref.watch(currentUserProvider)?.toQuickResource(),
          ));

      _textEditingController.clear();
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();

    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final liveComments = ref.watch(combinedCommentsProvider(uuid: widget.uuid));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(combinedCommentsProvider(uuid: widget.uuid));
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: liveComments.when(
                data: (data) {
                  if (liveComments.isRefreshing) {
                    return const Center(
                      child: LoadingOverlay(),
                    );
                  }

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
                onFieldSubmitted: (String? value) => _addComment(value),
              ),
            ),
            // Add more chat messages as needed
          ],
        ),
      ),
    );
  }
}
