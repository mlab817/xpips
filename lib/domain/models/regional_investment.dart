import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'option.dart';

part 'regional_investment.freezed.dart';
part 'regional_investment.g.dart';

@freezed
class RegionalInvestment with _$RegionalInvestment {
  factory RegionalInvestment({
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "region") Option? region,
    @JsonKey(name: "y2022") double? y2022,
    @JsonKey(name: "y2023") double? y2023,
    @JsonKey(name: "y2024") double? y2024,
    @JsonKey(name: "y2025") double? y2025,
    @JsonKey(name: "y2026") double? y2026,
    @JsonKey(name: "y2027") double? y2027,
    @JsonKey(name: "y2028") double? y2028,
    @JsonKey(name: "y2029") double? y2029,
  }) = _RegionalInvestment;

  factory RegionalInvestment.fromJson(Map<String, dynamic> json) =>
      _$RegionalInvestmentFromJson(json);

  // dump regional investment
  @override
  String toString() {
    return jsonEncode(this);
  }
}
