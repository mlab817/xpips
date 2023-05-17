import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_sources/app_service_client.dart';
import '../requests/projects_request.dart';
import '../responses/project_response.dart';
import '../responses/projects_response.dart';

abstract class ProjectRepository {
  Future<ProjectsResponse> getAll(ProjectsRequest input);

  // get One
  Future<ProjectResponse> get(String uuid);

// create

// update

// delete
}

class ProjectRepositoryImplementer implements ProjectRepository {
  ProjectRepositoryImplementer(this.client);

  final AppServiceClient client;

  @override
  Future<ProjectsResponse> getAll(ProjectsRequest input) async {
    return await client.getAllProjects(input);
  }

  @override
  Future<ProjectResponse> get(String uuid) async {
    return client.getProject(uuid);
  }
}

final projectRepositoryProvider = Provider<ProjectRepositoryImplementer>((ref) {
  print('projectRepositoryProvider called');

  final client = ref
      .watch(appServiceClientProvider); // this is not affected by dio provider?

  return ProjectRepositoryImplementer(client);
});
