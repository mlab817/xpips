import 'dart:async';

import 'package:pips/data/repositories/project_repository.dart';
import 'package:pips/data/responses/project_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewpap_controller.g.dart';

// return async value for pap
// [ProjectProvider]
@Riverpod(keepAlive: true)
Future<ProjectResponse> futureProject(FutureProjectRef ref, {required String uuid}) async {
  final repository = ref.watch(projectRepositoryProvider);

  // if uuid is null, set the uuid to 'new'

  return repository.get(uuid);
}
