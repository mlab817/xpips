import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/chat_repository.dart';
import '../../data/requests/chats_request.dart';
import '../../data/responses/responses.dart';

part 'chats_controller.g.dart';

@Riverpod(keepAlive: true)
Future<ChatRoomsResponse> chatRooms(ChatRoomsRef ref) async {
  final repository = ref.watch(chatRepositoryProvider);
  final request = ref.watch(chatsRequestControllerProvider);

  return await repository.get(request);
}

@Riverpod(keepAlive: true)
class ChatsRequestController extends _$ChatsRequestController {
  @override
  ChatsRequest build() => ChatsRequest.initial();

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

  void updateQuery(String q) {
    state = state.copyWith(q: q);
  }
}
