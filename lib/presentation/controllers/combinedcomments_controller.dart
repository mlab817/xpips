import 'dart:async';
import 'dart:convert';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/comment_response.dart';
import '../../domain/models/models.dart';
import 'controllers.dart';

part 'combinedcomments_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<List<Comment>> combinedComments(CombinedCommentsRef ref,
    {required String uuid}) async* {
  // initialize an empty comments list
  List<Comment> comments = <Comment>[];

  // get the comments from repository
  final commentsRef = ref.watch(commentsControllerProvider(uuid: uuid));

  if (commentsRef.value != null) {
    comments.addAll(commentsRef.value?.data ?? []);
  }

  yield comments;

  // final Stream<Comment> newCommentStream =
  //     ref.watch(realTimeCommentsProvider(uuid));
  //
  // await for (final newComment in newCommentStream) {
  //   comments.add(newComment);
  //   yield comments;
  // }
  // yield comments;

// ignore: avoid_manual_providers_as_generated_provider_dependency
  var simulatedCommentsStream = ref.watch(
      realTimeCommentsStreamProvider(uuid: uuid)
          .stream); // TODO: stream is deprecated, make sure to change it

  await for (final ChannelReadEvent event in simulatedCommentsStream) {
    if (kDebugMode) {
      print("event triggered $event");
    }

    var newComment = CommentResponse.fromJson(jsonDecode(event.data));

    comments.add(newComment.comment);

    yield comments;
  }
}
