import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_sources/app_service_client.dart';
import '../../domain/models/projects_request.dart';
import '../../domain/models/projects_response.dart';

abstract class ProjectRepository {
  Future<ProjectsResponse> getAll(ProjectsRequest input);

  // get One

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
}

final projectRepositoryProvider = Provider<ProjectRepositoryImplementer>((ref) {
  print('projectRepositoryProvider called');

  final client = ref
      .watch(appServiceClientProvider); // this is not affected by dio provider?

  return ProjectRepositoryImplementer(client);
});
