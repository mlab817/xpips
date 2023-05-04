import 'package:freezed_annotation/freezed_annotation.dart';

part 'updatepassword_request.freezed.dart';

part 'updatepassword_request.g.dart';

@freezed
class UpdatePasswordRequest with _$UpdatePasswordRequest {
  factory UpdatePasswordRequest({
    @JsonKey(name: "current_password") required String currentPassword,
    @JsonKey(name: "password") required String password,
    @JsonKey(
        name: "password_confirmation") required String passwordConfirmation,
  }) = _UpdatePasswordRequest;

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);
}
