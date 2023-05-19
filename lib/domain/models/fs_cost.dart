import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/mixins.dart';

part 'fs_cost.freezed.dart';
part 'fs_cost.g.dart';

@freezed
class FsCost with _$FsCost, TotalCostMixin {
  factory FsCost({
    @JsonKey(name: "y2023") double? y2023,
    @JsonKey(name: "y2024") double? y2024,
    @JsonKey(name: "y2025") double? y2025,
    @JsonKey(name: "y2026") double? y2026,
    @JsonKey(name: "y2027") double? y2027,
    @JsonKey(name: "y2028") double? y2028,
  }) = _FsCost;

  factory FsCost.fromJson(Map<String, dynamic> json) => _$FsCostFromJson(json);

  FsCost._() : super();
}
