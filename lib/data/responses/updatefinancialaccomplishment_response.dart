import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/models.dart';

part 'updatefinancialaccomplishment_response.g.dart';

@JsonSerializable()
class UpdateFinancialAccomplishmentResponse {
  final FinancialAccomplishment? data;
  final bool success;
  final String message;

  UpdateFinancialAccomplishmentResponse({
    this.data,
    required this.success,
    required this.message,
  });

  factory UpdateFinancialAccomplishmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateFinancialAccomplishmentResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateFinancialAccomplishmentResponseToJson(this);
}
