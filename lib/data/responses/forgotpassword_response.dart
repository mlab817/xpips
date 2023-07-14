import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgotpassword_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
  String status;

  ForgotPasswordResponse({
    required this.status,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
