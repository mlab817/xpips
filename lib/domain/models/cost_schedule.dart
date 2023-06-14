import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_schedule.freezed.dart';
part 'cost_schedule.g.dart';

@freezed
class CostSchedule with _$CostSchedule {
  factory CostSchedule({
    int? id,
    required double? y2023,
    required double? y2024,
    required double? y2025,
    required double? y2026,
    required double? y2027,
    required double? y2028,
  }) = _CostSchedule;

  double get total {
    return (y2023 ?? 0) +
        (y2024 ?? 0) +
        (y2025 ?? 0) +
        (y2026 ?? 0) +
        (y2027 ?? 0) +
        (y2028 ?? 0);
  }

  // enable getter
  CostSchedule._();

  factory CostSchedule.fromJson(Map<String, dynamic> json) =>
      _$CostScheduleFromJson(json);

  static CostSchedule initial() {
    return CostSchedule(
      y2023: 0,
      y2024: 0,
      y2025: 0,
      y2026: 0,
      y2027: 0,
      y2028: 0,
    );
  }
}
