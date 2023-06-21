import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  factory LoginRequest({
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "password") required String password,
  }) = _LoginCredentials;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  static LoginRequest initial() {
    return LoginRequest(
      username: '',
      password: '',
    );
  }
}
