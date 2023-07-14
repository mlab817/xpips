import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_accomplishment.freezed.dart';

part 'financial_accomplishment.g.dart';

@freezed
class FinancialAccomplishment with _$FinancialAccomplishment {
  factory FinancialAccomplishment({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "nep_2023") double? nep2023,
    @JsonKey(name: "nep_2024") double? nep2024,
    @JsonKey(name: "nep_2025") double? nep2025,
    @JsonKey(name: "nep_2026") double? nep2026,
    @JsonKey(name: "nep_2027") double? nep2027,
    @JsonKey(name: "nep_2028") double? nep2028,
    @JsonKey(name: "gaa_2023") double? gaa2023,
    @JsonKey(name: "gaa_2024") double? gaa2024,
    @JsonKey(name: "gaa_2025") double? gaa2025,
    @JsonKey(name: "gaa_2026") double? gaa2026,
    @JsonKey(name: "gaa_2027") double? gaa2027,
    @JsonKey(name: "gaa_2028") double? gaa2028,
    @JsonKey(name: "disbursement_2023") double? disbursement2023,
    @JsonKey(name: "disbursement_2024") double? disbursement2024,
    @JsonKey(name: "disbursement_2025") double? disbursement2025,
    @JsonKey(name: "disbursement_2026") double? disbursement2026,
    @JsonKey(name: "disbursement_2027") double? disbursement2027,
    @JsonKey(name: "disbursement_2028") double? disbursement2028,
  }) = _FinancialAccomplishment;

  factory FinancialAccomplishment.fromJson(Map<String, dynamic> json) =>
      _$FinancialAccomplishmentFromJson(json);

  // dump the entire variable
  @override
  String toString() {
    return jsonEncode(this);
  }

  FinancialAccomplishment._() : super();

  double _nepTotal() {
    return (nep2023 ?? 0) +
        (nep2024 ?? 0) +
        (nep2025 ?? 0) +
        (nep2026 ?? 0) +
        (nep2027 ?? 0) +
        (nep2028 ?? 0);
  }

  double get nepTotal => _nepTotal();

  double _gaaTotal() {
    return (gaa2023 ?? 0) +
        (gaa2024 ?? 0) +
        (gaa2025 ?? 0) +
        (gaa2026 ?? 0) +
        (gaa2027 ?? 0) +
        (gaa2028 ?? 0);
  }

  double get gaaTotal => _gaaTotal();

  double _disbursementTotal() {
    return (disbursement2023 ?? 0) +
        (disbursement2024 ?? 0) +
        (disbursement2025 ?? 0) +
        (disbursement2026 ?? 0) +
        (disbursement2027 ?? 0) +
        (disbursement2028 ?? 0);
  }

  double get disbursementTotal => _disbursementTotal();

  static FinancialAccomplishment initial() {
    return FinancialAccomplishment(
      nep2023: 0,
      nep2024: 0,
      nep2025: 0,
      nep2026: 0,
      nep2027: 0,
      nep2028: 0,
      gaa2023: 0,
      gaa2024: 0,
      gaa2025: 0,
      gaa2026: 0,
      gaa2027: 0,
      gaa2028: 0,
      disbursement2023: 0,
      disbursement2024: 0,
      disbursement2025: 0,
      disbursement2026: 0,
      disbursement2027: 0,
      disbursement2028: 0,
    );
  }
}
