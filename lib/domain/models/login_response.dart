import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpips/domain/models/user.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    @JsonKey(name: "user") required User user,
    @JsonKey(name: "access_token") required String accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
