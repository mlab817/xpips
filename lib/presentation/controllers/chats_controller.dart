import 'dart:async';

import 'package:pips/data/requests/projects_request.dart';
import 'package:pips/data/responses/responses.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/chats_repository.dart';

part 'chats_controller.g.dart';

@Riverpod(keepAlive: true)
Future<ChatRoomsResponse> chatRooms(ChatRoomsRef ref) async {
  final repository = ref.watch(chatsRepositoryProvider);
  final request = ref.watch(chatsRequestControllerProvider);

  return await repository.get(request);
}

@Riverpod(keepAlive: true)
class ChatsRequestController extends _$ChatsRequestController {
  @override
  ProjectsRequest build() => ProjectsRequest.initial();

  void update({
    int? perPage,
    int? page,
  }) {
    state = state.copyWith(
        page: page ?? state.page, perPage: perPage ?? state.perPage);
  }

  void previousPage() {
    // if page is not 1, then, go back to previous page
    if (state.page > 1) {
      state = state.copyWith(page: state.page - 1);
    }
  }

  void nextPage() {
    state = state.copyWith(page: state.page + 1);
  }
}
