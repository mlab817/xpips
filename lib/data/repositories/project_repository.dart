import 'package:pips/data/responses/createproject_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';
import '../requests/newproject_request.dart';
import '../requests/requests.dart';
import '../responses/patchproject_response.dart';
import '../responses/responses.dart';
import '../responses/updatefinancialaccomplishment_response.dart';

part 'project_repository.g.dart';

abstract class ProjectRepository {
  Future<ProjectsResponse> getAll(ProjectsRequest input);

  // get One
  Future<ProjectResponse> get(String uuid);

  // create
  Future<CreateProjectResponse> post(NewProjectRequest request);

  // update
  Future<UpdateProjectResponse> update(String uuid, FullProjectRequest request);

  // delete
  Future<DeleteProjectResponse> delete(String uuid);

  // patch
  // we use string, dynamic for payload because we will only post one key-value pair at a time
  Future<PatchProjectResponse> patch(String uuid, Map<String, dynamic> payload);

  Future<UpdateFinancialAccomplishmentResponse> updateFa(int id, Map<String, dynamic> payload);
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

  @override
  Future<CreateProjectResponse> post(NewProjectRequest request) async {
    return await client.createProject(request);
  }

  @override
  Future<UpdateProjectResponse> update(
      String uuid, FullProjectRequest request) async {
    return await client.updateProject(uuid, request);
  }

  @override
  Future<PatchProjectResponse> patch(
      String uuid, Map<String, dynamic> payload) async {
    return await client.patchProject(uuid, payload);
  }
  
  @override
  Future<UpdateFinancialAccomplishmentResponse> updateFa(int id, Map<String, dynamic> payload) async {
    return await client.updateFinancialAccomplishment(id, payload);
  }
}

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  return ProjectRepositoryImplementer(
    client: ref.watch(appServiceClientProvider),
  );
}
