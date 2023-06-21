import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../../domain/models/cost_schedule.dart';
import '../../domain/models/fs_investment.dart';
import '../../domain/models/regional_investment.dart';
import '../data_sources/app_service_client.dart';
import '../requests/requests.dart';
import '../responses/responses.dart';

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
  Future<PatchProjectResponse> patch(
    String uuid,
    Map<String, dynamic> payload,
  );

  Future<UpdateFinancialAccomplishmentResponse> updateFa(
    String uuid,
    Map<String, dynamic> payload,
  );

  Future<StatusResponse> updateRow(
    String uuid,
    CostSchedule payload,
  );

  Future<StatusResponse> updateRap(
    String uuid,
    CostSchedule payload,
  );

  Future<StatusResponse> updateFs(
    String uuid,
    CostSchedule payload,
  );

  Future<RegionalInvestmentResponse> updateRegionalInvestment(
    String uuid,
    RegionalInvestment payload,
  );

  Future<void> removeRegionalInvestment(int id);

  Future<FsInvestmentResponse> updateFsInvestment(
    String uuid,
    FsInvestment payload,
  );

  Future<void> removeFsInvestment(int id);

  // Duplicates the PAP to be edited on the current updating period
  Future<ProjectResponse> duplicate(String uuid);

  Future<ProjectsResponse> search(String query);

  Future<ProjectsResponse> getArchived(ArchiveRequest input);
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
  Future<UpdateFinancialAccomplishmentResponse> updateFa(
      String uuid, Map<String, dynamic> payload) async {
    return await client.updateFinancialAccomplishment(uuid, payload);
  }

  @override
  Future<StatusResponse> updateFs(String uuid, CostSchedule payload) async {
    return await client.updateFs(uuid, payload);
  }

  @override
  Future<StatusResponse> updateRap(String uuid, CostSchedule payload) async {
    return await client.updateRap(uuid, payload);
  }

  @override
  Future<StatusResponse> updateRow(String uuid, CostSchedule payload) async {
    return await client.updateRow(uuid, payload);
  }

  @override
  Future<RegionalInvestmentResponse> updateRegionalInvestment(
      String uuid, RegionalInvestment payload) async {
    return await client.updateRegionalInvestment(uuid, payload);
  }

  @override
  Future<FsInvestmentResponse> updateFsInvestment(
      String uuid, FsInvestment payload) async {
    return await client.updateFsInvestment(uuid, payload);
  }

  @override
  Future<void> removeRegionalInvestment(int id) async {
    return await client.removeRegionalInvestment(id);
  }

  @override
  Future<void> removeFsInvestment(int id) async {
    return await client.removeFsInvestment(id);
  }

  @override
  Future<ProjectResponse> duplicate(String uuid) async {
    return await client.clone(uuid);
  }

  @override
  Future<ProjectsResponse> search(String query) async {
    return await client.search(query);
  }

  @override
  Future<ProjectsResponse> getArchived(ArchiveRequest input) async {
    return await client.getArchived(input);
  }
}

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  return ProjectRepositoryImplementer(
    client: ref.watch(appServiceClientProvider),
  );
}
