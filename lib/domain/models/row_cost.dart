import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/mixins.dart';

part 'row_cost.freezed.dart';
part 'row_cost.g.dart';

@freezed
class RowCost with _$RowCost, TotalCostMixin {
  factory RowCost({
    @JsonKey(name: "y2023") double? y2023,
    @JsonKey(name: "y2024") double? y2024,
    @JsonKey(name: "y2025") double? y2025,
    @JsonKey(name: "y2026") double? y2026,
    @JsonKey(name: "y2027") double? y2027,
    @JsonKey(name: "y2028") double? y2028,
  }) = _RowCost;

  factory RowCost.fromJson(Map<String, dynamic> json) =>
      _$RowCostFromJson(json);

  RowCost._() : super();

  static RowCost initial() {
    return RowCost(
      y2023: 0,
      y2024: 0,
      y2025: 0,
      y2026: 0,
      y2027: 0,
      y2028: 0,
    );
  }
}
