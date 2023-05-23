import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request.freezed.dart';
part 'signup_request.g.dart';

@freezed
class SignupRequest with _$SignupRequest {
  factory SignupRequest({
    @JsonKey(name: "office_id") int? officeId,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "position") required String position,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "contact_number") required String contactNumber,
    @JsonKey(name: "password") required String password,
    String? authorization,
  }) = _SignupRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  static SignupRequest initial() {
    return SignupRequest(
      username: '',
      password: '',
      firstName: '',
      lastName: '',
      position: '',
      email: '',
      contactNumber: '',
      officeId: null,
      authorization: '',
    );
  }
}
