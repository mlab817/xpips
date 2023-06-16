import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/pipsstatus_repository.dart';
import 'package:pips/data/repositories/project_repository.dart';
import 'package:pips/data/requests/projects_request.dart';
import 'package:pips/data/responses/pipsstatus_response.dart';
import 'package:pips/data/responses/projects_response.dart';

class HomeScreenController extends AutoDisposeAsyncNotifier<ProjectsResponse> {
  Future<ProjectsResponse> getAll() async {
    final repository = ref.watch(projectRepositoryProvider);
    final request = ref.watch(projectsRequestControllerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard<ProjectsResponse>(
        () => repository.getAll(request));

    return repository.getAll(request);
  }

  @override
  Future<ProjectsResponse> build() async {
    return getAll();
  }
}

final homeScreenControllerProvider =
    AutoDisposeAsyncNotifierProvider<HomeScreenController, ProjectsResponse>(
        () {
  return HomeScreenController();
});

// return list of PIPS statuses and the number of projects
class PipsStatusController extends AsyncNotifier<PipsStatusResponse> {
  Future<PipsStatusResponse> get() async {
    final repository = ref.watch(pipsStatusRepositoryProvider);

    state = const AsyncLoading();

    final response = repository.getAll();

    state = await AsyncValue.guard<PipsStatusResponse>(() => response);

    return response;
  }

  @override
  FutureOr<PipsStatusResponse> build() {
    return get();
  }
}

final pipsStatusControllerProvider =
    AsyncNotifierProvider<PipsStatusController, PipsStatusResponse>(() {
  return PipsStatusController();
});

class ProjectsRequestController extends Notifier<ProjectsRequest> {
  void update({
    int? perPage,
    int? page,
    String? q,
    List<int>? types,
    List<int>? spatialCoverages,
    bool? pip,
    bool? cip,
    bool? trip,
    bool? rdip,
    List<int>? pdpChapters,
    List<int>? projectStatuses,
    List<int>? categories,
    List<int>? pipolStatuses,
    List<int>? pipsStatuses,
    List<int>? offices,
    List<int>? fundingSources,
  }) {
    state = state.copyWith(
      perPage: perPage ?? 25,
      page: page ?? 1,
      q: q ?? state.q,
      types: types ?? state.types,
      spatialCoverages: spatialCoverages ?? state.spatialCoverages,
      pip: pip,
      cip: cip,
      trip: trip,
      rdip: rdip,
      pdpChapters: pdpChapters ?? state.pdpChapters,
      projectStatuses: projectStatuses ?? state.projectStatuses,
      categories: categories ?? state.categories,
      pipolStatuses: pipolStatuses ?? state.pipolStatuses,
      pipsStatuses: pipsStatuses ?? state.pipsStatuses,
      offices: offices ?? state.offices,
      fundingSources: fundingSources ?? state.fundingSources,
    );
  }

  void clearQuery() {
    state = state.copyWith(q: '', pipolStatuses: [], pipsStatuses: []);
  }

  @override
  ProjectsRequest build() {
    return ProjectsRequest(perPage: 25, page: 1, pipsStatuses: []);
  }
}

final projectsRequestControllerProvider =
    NotifierProvider<ProjectsRequestController, ProjectsRequest>(() {
  return ProjectsRequestController();
});
