import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/fs_investment.dart';
import '../../domain/models/regional_investment.dart';

part 'status_response.g.dart';

@JsonSerializable()
class StatusResponse {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "message")
  String? message;

  StatusResponse({
    this.status,
    this.success,
    this.message,
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatusResponseToJson(this);
}

@JsonSerializable()
class RegionalInvestmentResponse extends StatusResponse {
  @JsonKey(name: 'data')
  final RegionalInvestment data;

  RegionalInvestmentResponse({
    required this.data,
  });

  factory RegionalInvestmentResponse.fromJson(Map<String, dynamic> json) =>
      _$RegionalInvestmentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegionalInvestmentResponseToJson(this);
}

@JsonSerializable()
class FsInvestmentResponse extends StatusResponse {
  @JsonKey(name: 'data')
  final FsInvestment data;

  FsInvestmentResponse({
    required this.data,
  });

  factory FsInvestmentResponse.fromJson(Map<String, dynamic> json) =>
      _$FsInvestmentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FsInvestmentResponseToJson(this);
}
