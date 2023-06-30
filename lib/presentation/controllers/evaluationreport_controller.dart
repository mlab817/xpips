import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/evaluationreport_repository.dart';
import '../../data/responses/evaluationreport_response.dart';
import '../../domain/models/evaluation_report.dart';

part 'evaluationreport_controller.g.dart';

@Riverpod(keepAlive: true)
Future<EvaluationReportResponse> futureEvaluation(FutureEvaluationRef ref,
    {required String uuid}) async {
  final repository = ref.watch(evaluationRepositoryProvider);

  return await repository.getEvaluation(uuid);
}

@Riverpod(keepAlive: true)
class EvaluationReportController extends _$EvaluationReportController {
  @override
  EvaluationReport build(String uuid) {
    final asyncValue = ref.watch(futureEvaluationProvider(uuid: uuid));

    print('-- asyncValue --');
    print(asyncValue);

    if (!asyncValue.isLoading) {
      return asyncValue.value!.data;
    }

    return asyncValue.value!.data;
  }

  void update({
    String? title,
    String? fundingSources,
    String? implementingUnits,
    String? background,
    String? rationale,
    String? objectives,
    String? beneficiaries,
    String? spatialCoverage,
    String? components,
    double? budgetEstimate,
    String? implementationPeriod,
    String? responsivenessSdgs,
    String? responsivenessAgenda,
    String? responsivenessPdp,
    String? responsivenessNafmip,
    String? responsivenessPbp,
    String? readiness,
    String? typology,
    String? otherComments,
    bool? recommendingApproval,
    String? otherRecommendations,
  }) {
    state = state.copyWith(
      title: title ?? state.title,
      fundingSources: fundingSources ?? state.fundingSources,
      implementingUnits: implementingUnits ?? state.implementingUnits,
      background: background ?? state.background,
      rationale: rationale ?? state.rationale,
      objectives: objectives ?? state.objectives,
      beneficiaries: beneficiaries ?? state.beneficiaries,
      spatialCoverage: spatialCoverage ?? state.spatialCoverage,
      components: components ?? state.components,
      budgetEstimate: budgetEstimate ?? state.budgetEstimate,
      implementationPeriod: implementationPeriod ?? state.implementationPeriod,
      responsivenessSdgs: responsivenessSdgs ?? state.responsivenessSdgs,
      responsivenessAgenda: responsivenessAgenda ?? state.responsivenessAgenda,
      responsivenessPdp: responsivenessPdp ?? state.responsivenessPdp,
      responsivenessNafmip: responsivenessNafmip ?? state.responsivenessNafmip,
      responsivenessPbp: responsivenessPbp ?? state.responsivenessPbp,
      readiness: readiness ?? state.readiness,
      typology: typology ?? state.typology,
      otherComments: otherComments ?? state.otherComments,
      recommendingApproval: recommendingApproval ?? state.recommendingApproval,
      otherRecommendations: otherRecommendations ?? state.otherRecommendations,
    );
  }
}
