import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/requests/projects_request.dart';
import 'package:pips/data/responses/responses.dart';
import 'package:pips/presentation/controllers/home_controller.dart';

import '../../data/repositories/chats_repository.dart';

// future provider for chats
final chatMessagesProvider = FutureProvider<ChatRoomsResponse>((ref) async {
  return await ref
      .watch(chatsRepositoryProvider)
      .get(ref.watch(projectsRequestControllerProvider));
});

class ChatsController extends AsyncNotifier<ChatRoomsResponse> {
  Future<ChatRoomsResponse> get() async {
    final repository = ref.watch(chatsRepositoryProvider);
    final request = ref.watch(chatsRequestProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.get(request));

    final response = await repository.get(request);

    return response;
  }

  @override
  FutureOr<ChatRoomsResponse> build() => get();
}

final chatsControllerProvider =
    AsyncNotifierProvider<ChatsController, ChatRoomsResponse>(() {
  return ChatsController();
});

class ChatsRequestController extends Notifier<ProjectsRequest> {
  @override
  ProjectsRequest build() => ProjectsRequest(perPage: 25, page: 1);
}

final chatsRequestProvider =
    NotifierProvider<ChatsRequestController, ProjectsRequest>(() {
  return ChatsRequestController();
});
