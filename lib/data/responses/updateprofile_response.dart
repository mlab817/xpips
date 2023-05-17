import 'package:freezed_annotation/freezed_annotation.dart';

part 'updateprofile_response.freezed.dart';
part 'updateprofile_response.g.dart';

@freezed
class UpdateProfileResponse with _$UpdateProfileResponse {
  factory UpdateProfileResponse({
    required String status,
  }) = _UpdateProfileResponse;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}
