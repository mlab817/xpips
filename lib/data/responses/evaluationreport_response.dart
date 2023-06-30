import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/evaluation_report.dart';

part 'evaluationreport_response.freezed.dart';
part 'evaluationreport_response.g.dart';

@freezed
class EvaluationReportResponse with _$EvaluationReportResponse {
  factory EvaluationReportResponse({
    required EvaluationReport data,
  }) = _EvaluationReportResponse;

  factory EvaluationReportResponse.fromJson(Map<String, dynamic> json) =>
      _$EvaluationReportResponseFromJson(json);
}
