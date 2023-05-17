import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/comments_repository.dart';
import 'package:pips/data/responses/comments_response.dart';

class CommentsController
    extends AutoDisposeFamilyAsyncNotifier<CommentsResponse, String> {
  Future<CommentsResponse> get(String uuid) async {
    final repository = ref.watch(commentsRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.showComments(uuid));

    return await repository.showComments(uuid);
  }

  @override
  FutureOr<CommentsResponse> build(String arg) async => get(arg);
}

final commentsControllerProvider = AutoDisposeAsyncNotifierProviderFamily<
    CommentsController, CommentsResponse, String>(() {
  return CommentsController();
});
