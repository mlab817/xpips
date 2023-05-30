import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';
import '../requests/requests.dart';
import '../responses/responses.dart';

part 'project_repository.g.dart';

abstract class ProjectRepository {
  Future<ProjectsResponse> getAll(ProjectsRequest input);

  // get One
  Future<ProjectResponse> get(String uuid);

  // create

  // update

  // delete
  Future<DeleteProjectResponse> delete(String uuid);
}

class ProjectRepositoryImplementer implements ProjectRepository {
  ProjectRepositoryImplementer({required this.client});

  final AppServiceClient client;

  @override
  Future<ProjectsResponse> getAll(ProjectsRequest input) async {
    return await client.getAllProjects(input);
  }

  @override
  Future<ProjectResponse> get(String uuid) async {
    return client.getProject(uuid);
  }

  @override
  Future<DeleteProjectResponse> delete(String uuid) async {
    return client.deleteProject(uuid);
  }
}

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  return ProjectRepositoryImplementer(
    client: ref.watch(appServiceClientProvider),
  );
}
