import 'dart:async';

import 'package:pips/data/repositories/comments_repository.dart';
import 'package:pips/data/responses/comments_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comments_controller.g.dart';

@Riverpod(keepAlive: true)
Future<CommentsResponse> commentsController(CommentsControllerRef ref,
    {required String uuid}) async {
  final repository = ref.watch(commentsRepositoryProvider);

  return repository.showComments(uuid);
}
