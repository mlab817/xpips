import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/chat_repository.dart';
import '../../data/responses/chatrooms_response.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatScreenController extends _$ChatScreenController {
  Future<void> getChatRooms() async {
    final repository = ref.watch(chatRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.getChatRooms());
  }

  @override
  FutureOr<ChatRoomsResponse> build() => Future.value(state.value);
}
