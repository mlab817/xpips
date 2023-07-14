import 'package:freezed_annotation/freezed_annotation.dart';

part 'evaluation_report.freezed.dart';
part 'evaluation_report.g.dart';

@freezed
class EvaluationReport with _$EvaluationReport {
  factory EvaluationReport({
    @JsonKey(name: 'project_id') int? projectId,
    String? title,
    @JsonKey(name: 'funding_sources') String? fundingSources,
    @JsonKey(name: 'implementing_units') String? implementingUnits,
    String? background,
    String? rationale,
    String? objectives,
    String? beneficiaries,
    @JsonKey(name: 'spatial_coverage') String? spatialCoverage,
    String? components,
    @JsonKey(name: 'budget_estimate') double? budgetEstimate,
    @JsonKey(name: 'implementation_period') String? implementationPeriod,
    @JsonKey(name: 'responsiveness_sdgs') String? responsivenessSdgs,
    @JsonKey(name: 'responsiveness_agenda') String? responsivenessAgenda,
    @JsonKey(name: 'responsiveness_pdp') String? responsivenessPdp,
    @JsonKey(name: 'responsiveness_nafmip') String? responsivenessNafmip,
    @JsonKey(name: 'responsiveness_pbp') String? responsivenessPbp,
    String? readiness,
    String? typology,
    @JsonKey(name: 'other_comments') String? otherComments,
    @JsonKey(name: 'recommending_approval') bool? recommendingApproval,
    @JsonKey(name: 'other_recommendations') String? otherRecommendations,
  }) = _EvaluationReport;

  factory EvaluationReport.fromJson(Map<String, dynamic> json) =>
      _$EvaluationReportFromJson(json);

  static EvaluationReport initial() => EvaluationReport();

  EvaluationReport._();
}
