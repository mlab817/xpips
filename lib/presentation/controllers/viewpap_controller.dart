import 'dart:async';

import 'package:pips/data/repositories/project_repository.dart';
import 'package:pips/data/responses/project_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewpap_controller.g.dart';

// return async value for pap
@Riverpod(keepAlive: true)
Future<ProjectResponse> project(ProjectRef ref, {required String uuid}) async {
  final repository = ref.watch(projectRepositoryProvider);

  return repository.get(uuid);
}
