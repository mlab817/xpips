import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/domain/models/projects_response.dart';

import '../../data/repositories/project_repository.dart';
import '../../domain/models/projects_request.dart';

class ProjectController extends AsyncNotifier<void> {
  late ProjectsRequest request;
  int currentPage = 1;
  String? q;

  void nextPage() {
    currentPage++;

    getAll();
  }

  void previousPage() {
    if (currentPage > 1) {
      currentPage--;
      getAll();
    }
  }

  Future<void> getAll() async {
    final repository = ref.read(projectRepositoryProvider);

    state = const AsyncLoading();

    final response =
        repository.getAll(request.copyWith(page: currentPage, q: q));

    // retrieve notifications
    state = await AsyncValue.guard<ProjectsResponse>(() => response);
  }

  @override
  FutureOr<void> build() {
    request = ProjectsRequest(perPage: 25, page: currentPage);

    return getAll();
  }
}

final projectControllerProvider =
    AsyncNotifierProvider<ProjectController, void>(() {
  return ProjectController();
});
