import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/project_repository.dart';
import 'package:pips/data/responses/project_response.dart';

class ViewPapController extends FamilyAsyncNotifier<ProjectResponse, String> {
  Future<ProjectResponse> get(String arg) async {
    final repository = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.get(arg));

    return await repository.get(arg);
  }

  @override
  FutureOr<ProjectResponse> build(String arg) => get(arg);
}

final viewPapControllerProvider =
    AsyncNotifierProviderFamily<ViewPapController, ProjectResponse, String>(() {
  return ViewPapController();
});
