import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpips/data/data_sources/network.dart';
import 'package:xpips/domain/models/projects_request.dart';

import '../../domain/models/projects_response.dart';

abstract class ProjectRepository {
  Future<ProjectsResponse> getAll(ProjectsRequest input);
}

class ProjectRepositoryImplementer implements ProjectRepository {
  ProjectRepositoryImplementer(this.client);

  final AppServiceClient client;

  @override
  Future<ProjectsResponse> getAll(ProjectsRequest input) async {
    return await client.getAllProjects(input);
  }
}

final projectRepositoryProvider = Provider<ProjectRepositoryImplementer>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return ProjectRepositoryImplementer(client);
});
