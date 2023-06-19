import 'package:pips/data/repositories/project_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/projects_response.dart';

part 'homesearch_controller.g.dart';

@Riverpod(keepAlive: true)
Future<ProjectsResponse> homeSearch(HomeSearchRef ref,
    {required String query}) async {
  final repo = ref.watch(projectRepositoryProvider);

  return await repo.search(query);
}
