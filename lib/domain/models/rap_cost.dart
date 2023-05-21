import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/mixins.dart';

part 'rap_cost.freezed.dart';
part 'rap_cost.g.dart';

@freezed
class RapCost with _$RapCost, TotalCostMixin {
  factory RapCost({
    @JsonKey(name: "y2023") double? y2023,
    @JsonKey(name: "y2024") double? y2024,
    @JsonKey(name: "y2025") double? y2025,
    @JsonKey(name: "y2026") double? y2026,
    @JsonKey(name: "y2027") double? y2027,
    @JsonKey(name: "y2028") double? y2028,
  }) = _RapCost;

  factory RapCost.fromJson(Map<String, dynamic> json) =>
      _$RapCostFromJson(json);

  RapCost._() : super();

  static RapCost initial() {
    return RapCost(
      y2023: 0,
      y2024: 0,
      y2025: 0,
      y2026: 0,
      y2027: 0,
      y2028: 0,
    );
  }
}
