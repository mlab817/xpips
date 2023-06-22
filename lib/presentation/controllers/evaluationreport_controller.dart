import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/evaluation_report.dart';

part 'evaluationreport_controller.g.dart';

@Riverpod(keepAlive: true)
class EvaluationReportController extends _$EvaluationReportController {
  @override
  EvaluationReport build() => EvaluationReport.initial();

  void update({
    // all properties
    String? title,
  }) {
    state = state.copyWith(
      title: title ?? state.title,
    );
  }
}
