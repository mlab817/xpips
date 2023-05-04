import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/chat_repository.dart';
import '../../data/responses/chatrooms_response.dart';

class ChatController extends AsyncNotifier<ChatRoomsResponse> {
  Future<ChatRoomsResponse> getChatRooms() async {
    final repository = ref.watch(chatRepositoryProvider);

    state = const AsyncLoading();

    final response = repository.getChatRooms();

    state = await AsyncValue.guard(() => response);

    return response;
  }

  @override
  FutureOr<ChatRoomsResponse> build() => getChatRooms();
}

final chatControllerProvider =
    AsyncNotifierProvider<ChatController, ChatRoomsResponse>(() {
  return ChatController();
});
