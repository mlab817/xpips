import 'dart:async';

import 'package:pips/data/repositories/comments_repository.dart';
import 'package:pips/data/responses/comments_response.dart';
import 'package:pips/presentation/controllers/viewpap_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// fetch all comments
class CommentsController extends AsyncNotifier<CommentsResponse> {
  Future<CommentsResponse> get() async {
    final project = ref.watch(selectedProjectProvider);
    final repository = ref.watch(commentsRepositoryProvider);

    state = const AsyncLoading();

    state =
        await AsyncValue.guard(() => repository.showComments(project!.uuid));

    return await repository.showComments(project!.uuid);
  }

  @override
  FutureOr<CommentsResponse> build() async => get();
}

final commentsControllerProvider =
    FutureProvider<CommentsResponse>((ref) async {
  print('comments controller provider called');
  final project = ref.watch(selectedProjectProvider);
  final repository = ref.watch(commentsRepositoryProvider);

  if (project == null) {
    throw UnimplementedError('TODO: implement commentsController provider');
  }

  return repository.showComments(project.uuid);
});

//
// final commentsProvider = Provider<List<Comment>>((ref) {
//   List<Comment> comments = <Comment>[];
//
//   final messagesProvider = ref.watch(commentsControllerProvider);
//
//   messagesProvider.when(
//       data: (data) {
//         comments = data.data;
//       },
//       error: (error, stacktrace) {},
//       loading: () {});
//
//   final newMessage = ref.listen(realTimeCommentsProvider, (previous, next) {
//     if (next.hasValue) {}
//   });
//
//   return comments;
// });

// @Riverpod(keepAlive: true)
// class SelectedProject extends _$SelectedProject {
//   Future<void> get(String uuid) async {
//     final repository = ref.watch(projectRepositoryProvider);
//
//     state = const AsyncLoading();
//
//     state = await AsyncValue.guard(() => repository.get(uuid));
//   }
//
//   @override
//   FutureOr<void> build() {
//     // do nothing
//   }
// }
