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
    String? authorization,
  }) = _SignupRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    FormData formData = FormData.fromMap({
      'office_id': officeId,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'position': position,
      'email': email,
      'contact_number': contactNumber,
      'authorization': authorization != null
          ? MultipartFile.fromFileSync(authorization!)
          : null, //TODO handle appending authorization form
    });

    final map = <String, dynamic>{};

    for (var field in formData.fields) {
      map[field.key] = field.value;
    }

    for (var file in formData.files) {
      map[file.key] = file.value;
    }

    return map;
  }
}
