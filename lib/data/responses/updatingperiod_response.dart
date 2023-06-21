import 'package:json_annotation/json_annotation.dart';

part 'updatingperiod_response.g.dart';

@JsonSerializable()
class UpdatingPeriodResponse {
  final int id;

  final String name;

  UpdatingPeriodResponse({
    required this.id,
    required this.name,
  });

  factory UpdatingPeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatingPeriodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatingPeriodResponseToJson(this);
}
