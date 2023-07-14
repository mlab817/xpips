import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/functions.dart';
import '../../application/providers/appserviceclient_provider.dart';
import '../../domain/entities/models.dart';
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

  Future<ProjectResponse> submitForReview(String uuid);
}

class ProjectRepositoryImplementer implements ProjectRepository {
  ProjectRepositoryImplementer({required this.client});

  final AppServiceClient client;

  @override
  Future<ProjectsResponse> getAll(ProjectsRequest input) async {
    try {
      return await client.getAllProjects(input);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ProjectResponse> get(String uuid) async {
    try {
      return await client.getProject(uuid);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<DeleteProjectResponse> delete(String uuid) async {
    try {
      return await client.deleteProject(uuid);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<CreateProjectResponse> post(NewProjectRequest request) async {
    try {
      return await client.createProject(request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<UpdateProjectResponse> update(
      String uuid, FullProjectRequest request) async {
    try {
      return await client.updateProject(uuid, request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<PatchProjectResponse> patch(
      String uuid, Map<String, dynamic> payload) async {
    try {
      return await client.patchProject(uuid, payload);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<UpdateFinancialAccomplishmentResponse> updateFa(
      String uuid, Map<String, dynamic> payload) async {
    try {
      return await client.updateFinancialAccomplishment(uuid, payload);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<StatusResponse> updateFs(String uuid, CostSchedule payload) async {
    try {
      return await client.updateFs(uuid, payload);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<StatusResponse> updateRap(String uuid, CostSchedule payload) async {
    try {
      return await client.updateRap(uuid, payload);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<StatusResponse> updateRow(String uuid, CostSchedule payload) async {
    try {
      return await client.updateRow(uuid, payload);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<RegionalInvestmentResponse> updateRegionalInvestment(
      String uuid, RegionalInvestment payload) async {
    try {
      return await client.updateRegionalInvestment(uuid, payload);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<FsInvestmentResponse> updateFsInvestment(
      String uuid, FsInvestment payload) async {
    try {
      return await client.updateFsInvestment(uuid, payload);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<void> removeRegionalInvestment(int id) async {
    try {
      return await client.removeRegionalInvestment(id);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<void> removeFsInvestment(int id) async {
    try {
      return await client.removeFsInvestment(id);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ProjectResponse> duplicate(String uuid) async {
    try {
      return await client.clone(uuid);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ProjectsResponse> search(String query) async {
    try {
      return await client.search(query);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ProjectsResponse> getArchived(ArchiveRequest input) async {
    try {
      return await client.getArchived(input);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ProjectResponse> submitForReview(String uuid) async {
    try {
      return await client.submitForReview(uuid);
    } catch (e) {
      throw formatError(e);
    }
  }
}

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  return ProjectRepositoryImplementer(
    client: ref.watch(appServiceClientProvider),
  );
}
