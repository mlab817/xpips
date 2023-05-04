import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpips/data/repositories/project_repository.dart';
import 'package:xpips/domain/models/projects_request.dart';

import '../../domain/models/projects_response.dart';

class ProjectController extends AsyncNotifier<ProjectsResponse> {
  late ProjectsRequest request;
  int currentPage = 1;
  String? q;

  void nextPage() {
    currentPage++;

    getAll();
  }

  Future<ProjectsResponse> getAll() async {
    final repository = ref.read(projectRepositoryProvider);

    state = const AsyncLoading();

    final response = repository
        .getAll(request.copyWith(page: currentPage, q: q));

    // retrieve notifications
    state = await AsyncValue.guard(() => response);

    return response;
  }

  @override
  FutureOr<ProjectsResponse> build() {
    request = ProjectsRequest(perPage: 25, page: currentPage);

    return getAll();
  }
}

final projectControllerProvider =
AsyncNotifierProvider<ProjectController, ProjectsResponse>(() {
  return ProjectController();
});
