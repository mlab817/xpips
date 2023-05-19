import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_credentials.freezed.dart';
part 'login_credentials.g.dart';

@freezed
class LoginCredentials with _$LoginCredentials {
  factory LoginCredentials({
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "password") required String password,
  }) = _LoginCredentials;

  factory LoginCredentials.fromJson(Map<String, dynamic> json) =>
      _$LoginCredentialsFromJson(json);

  static LoginCredentials initial() {
    return LoginCredentials(
      username: '',
      password: '',
    );
  }
}
