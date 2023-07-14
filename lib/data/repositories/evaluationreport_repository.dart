import 'package:pips/application/providers/appserviceclient_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/functions.dart';
import '../../domain/entities/evaluation_report.dart';
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
    try {
      return await client.deleteEvaluation(id: id);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<EvaluationReportResponse> getEvaluation(String uuid) async {
    try {
      return await client.getEvaluation(uuid: uuid);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<EvaluationReportResponse> postEvaluation(
      String uuid, EvaluationReport request) async {
    try {
      return await client.postEvaluation(uuid: uuid, request: request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<EvaluationReportResponse> putEvaluation(
      int id, EvaluationReport request) async {
    try {
      return await client.putEvaluation(id: id, request: request);
    } catch (e) {
      throw formatError(e);
    }
  }
}

@Riverpod(keepAlive: true)
EvaluationReportRepository evaluationRepository(EvaluationRepositoryRef ref) {
  return EvaluationReportRepositoryImplementer(
      client: ref.watch(appServiceClientProvider));
}
