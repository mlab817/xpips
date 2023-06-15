import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'option.dart';

part 'fs_investment.freezed.dart';
part 'fs_investment.g.dart';

@freezed
class FsInvestment with _$FsInvestment {
  factory FsInvestment({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "project_id") int? projectId,
    @JsonKey(name: "funding_source_id") int? fundingSourceId,
    @JsonKey(name: "funding_source") Option? fundingSource,
    @JsonKey(name: "y2022") double? y2022,
    @JsonKey(name: "y2023") double? y2023,
    @JsonKey(name: "y2024") double? y2024,
    @JsonKey(name: "y2025") double? y2025,
    @JsonKey(name: "y2026") double? y2026,
    @JsonKey(name: "y2027") double? y2027,
    @JsonKey(name: "y2028") double? y2028,
    @JsonKey(name: "y2029") double? y2029,
  }) = _FsInvestment;

  factory FsInvestment.fromJson(Map<String, dynamic> json) =>
      _$FsInvestmentFromJson(json);

  // dump regional investment
  @override
  String toString() {
    return jsonEncode(this);
  }

  static FsInvestment initial({required int projectId}) {
    return FsInvestment(
      projectId: projectId,
      fundingSourceId: null,
      fundingSource: null,
      y2022: 0,
      y2023: 0,
      y2024: 0,
      y2025: 0,
      y2026: 0,
      y2027: 0,
      y2028: 0,
      y2029: 0,
    );
  }
}
