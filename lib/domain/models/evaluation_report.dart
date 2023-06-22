import 'package:freezed_annotation/freezed_annotation.dart';

part 'evaluation_report.freezed.dart';
part 'evaluation_report.g.dart';

@freezed
class EvaluationReport with _$EvaluationReport {
  factory EvaluationReport({
    @JsonKey(name: 'project_id') int? projectId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'funding_sources') String? fundingSources,
    @JsonKey(name: 'implementing_units') String? implementingUnits,
    @JsonKey(name: 'background') String? background,
    @JsonKey(name: 'rationale') String? rationale,
    @JsonKey(name: 'objectives') String? objectives,
    @JsonKey(name: 'beneficiaries') String? beneficiaries,
    @JsonKey(name: 'spatial_coverage') String? spatialCoverage,
    @JsonKey(name: 'components') String? components,
    @JsonKey(name: 'budget_estimate') String? budgetEstimate,
    @JsonKey(name: 'implementation_period') String? implementationPeriod,
    @JsonKey(name: 'responsiveness') String? responsiveness,
    @JsonKey(name: 'responsiveness_sdgs') String? responsivenessSdgs,
    @JsonKey(name: 'responsiveness_agenda') String? responsivenessAgenda,
    @JsonKey(name: 'responsiveness_pdp') String? responsivenessPdp,
    @JsonKey(name: 'responsiveness_nafmip') String? responsivenessNafmip,
    @JsonKey(name: 'responsiveness_pbp') String? responsivenessPbp,
    @JsonKey(name: 'readiness') String? readiness,
    @JsonKey(name: 'typology') String? typology,
    @JsonKey(name: 'other_comments') String? otherComments,
    @JsonKey(name: 'recommending_approval') bool? recommendingApproval,
    @JsonKey(name: 'other_recommendations') String? otherRecommendations,
  }) = _EvaluationReport;

  factory EvaluationReport.fromJson(Map<String, dynamic> json) =>
      _$EvaluationReportFromJson(json);

  static EvaluationReport initial() {
    return EvaluationReport();
  }
}
