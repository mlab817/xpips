import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/chat_repository.dart';
import '../../data/responses/chatroom_response.dart';

class ChatRoomController
    extends AutoDisposeFamilyAsyncNotifier<ChatRoomResponse, int> {
  Future<ChatRoomResponse> getChatRoom(int chatRoomId) async {
    final repository = ref.watch(chatRepositoryProvider);

    state = const AsyncLoading();

    final response = repository.getChatRoom(chatRoomId);

    state = await AsyncValue.guard(() => response);

    return response;
  }

  @override
  FutureOr<ChatRoomResponse> build(int arg) {
    return getChatRoom(arg);
  }
}

final chatRoomControllerProvider = AutoDisposeAsyncNotifierProvider.family<
    ChatRoomController, ChatRoomResponse, int>(() {
  return ChatRoomController();
});
