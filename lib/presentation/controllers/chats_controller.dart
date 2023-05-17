import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:pips/data/requests/projects_request.dart';
import 'package:pips/data/responses/projects_response.dart';

abstract class ChatsRepository {
  Future<ProjectsResponse> get(ProjectsRequest request);
}

class ChatsRepositoryImplementer implements ChatsRepository {
  final AppServiceClient client;

  ChatsRepositoryImplementer(this.client);

  @override
  Future<ProjectsResponse> get(ProjectsRequest request) async {
    return client.getChats(request);
  }
}

final chatsRepositoryProvider = Provider<ChatsRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return ChatsRepositoryImplementer(client);
});

class ChatsController extends AsyncNotifier<ProjectsResponse> {
  Future<ProjectsResponse> get() async {
    final repository = ref.watch(chatsRepositoryProvider);
    final request = ref.watch(chatsRequestProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.get(request));

    final response = await repository.get(request);

    return response;
  }

  @override
  FutureOr<ProjectsResponse> build() => get();
}

final chatsControllerProvider =
AsyncNotifierProvider<ChatsController, ProjectsResponse>(() {
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
