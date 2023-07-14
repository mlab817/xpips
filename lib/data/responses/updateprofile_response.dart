import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/models.dart';

part 'updateprofile_response.freezed.dart';
part 'updateprofile_response.g.dart';

@freezed
class UpdateProfileResponse with _$UpdateProfileResponse {
  factory UpdateProfileResponse({
    required bool success,
    required User user,
  }) = _UpdateProfileResponse;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}
