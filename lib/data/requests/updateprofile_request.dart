import 'package:freezed_annotation/freezed_annotation.dart';

part 'updateprofile_request.freezed.dart';
part 'updateprofile_request.g.dart';

@freezed
class UpdateProfileRequest with _$UpdateProfileRequest {
  factory UpdateProfileRequest({
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "position") required String position,
    @JsonKey(name: "contact_number") required String contactNumber,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);
}
