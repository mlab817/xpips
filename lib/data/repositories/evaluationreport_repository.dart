import 'package:pips/application/providers/appserviceclient_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/evaluation_report.dart';
import '../data_sources/app_service_client.dart';
import '../responses/evaluationreport_response.dart';

part 'evaluationreport_repository.g.dart';

abstract class EvaluationReportRepository {
  Future<EvaluationReportResponse> getEvaluation(String uuid);

  Future<EvaluationReportResponse> postEvaluation(
      String uuid, EvaluationReport request);

  Future<EvaluationReportResponse> putEvaluation(
      int id, EvaluationReport request);

  Future<EvaluationReportResponse> deleteEvaluation(int id);
}

class EvaluationReportRepositoryImplementer
    implements EvaluationReportRepository {
  final AppServiceClient client;

  EvaluationReportRepositoryImplementer({
    required this.client,
  });

  @override
  Future<EvaluationReportResponse> deleteEvaluation(int id) async {
    return await client.deleteEvaluation(id: id);
  }

  @override
  Future<EvaluationReportResponse> getEvaluation(String uuid) async {
    return await client.getEvaluation(uuid: uuid);
  }

  @override
  Future<EvaluationReportResponse> postEvaluation(
      String uuid, EvaluationReport request) async {
    return await client.postEvaluation(uuid: uuid, request: request);
  }

  @override
  Future<EvaluationReportResponse> putEvaluation(
      int id, EvaluationReport request) async {
    return await client.putEvaluation(id: id, request: request);
  }
}

@Riverpod(keepAlive: true)
EvaluationReportRepository evaluationRepository(EvaluationRepositoryRef ref) {
  return EvaluationReportRepositoryImplementer(
      client: ref.watch(appServiceClientProvider));
}
