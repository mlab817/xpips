import 'dart:async';

import 'package:pips/domain/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'newcommentstream_controller.g.dart';

// stream controller that i can add new comments into
@Riverpod(keepAlive: true)
StreamController<Comment> newCommentLocalStreamController(
    NewCommentLocalStreamControllerRef ref) {
  //
  final StreamController<Comment> streamController =
      StreamController<Comment>();

  ref.onDispose(() => streamController.close());

  return streamController;
}

@Riverpod(keepAlive: true)
Stream<Comment> newCommentLocalStream(NewCommentLocalStreamRef ref) {
  //
  final streamController = ref.watch(newCommentLocalStreamControllerProvider);

  ref.onDispose(() => streamController.close());

  return streamController.stream;
}
