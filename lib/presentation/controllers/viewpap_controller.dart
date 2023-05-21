import 'dart:async';

import 'package:pips/data/repositories/project_repository.dart';
import 'package:pips/data/responses/project_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/project.dart';

part 'viewpap_controller.g.dart';

@Riverpod(keepAlive: true)
class SelectedProject extends _$SelectedProject {
  @override
  Project? build() => null;

  void update(Project project) {
    state = project;
  }
}

// return async value for pap
@Riverpod(keepAlive: true)
class ViewPapController extends _$ViewPapController {
  Future<ProjectResponse?> get() async {
    final repository = ref.watch(projectRepositoryProvider);
    final project = ref.watch(selectedProjectProvider);

    state = const AsyncLoading();

    if (project != null) {
      state = await AsyncValue.guard(() => repository.get(project.uuid));

      return await repository.get(project.uuid);
    } else {
      state = const AsyncData(null);

      return null;
    }
  }

  @override
  FutureOr<ProjectResponse?> build() => get();
}
