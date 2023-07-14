import 'package:freezed_annotation/freezed_annotation.dart';

part 'updatepassword_response.g.dart';

@JsonSerializable()
class UpdatePasswordResponse {
  String message;

  bool success;

  UpdatePasswordResponse({
    required this.message,
    required this.success,
  });

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordResponseToJson(this);
}
