import 'package:freezed_annotation/freezed_annotation.dart';

part 'deleteproject_response.freezed.dart';
part 'deleteproject_response.g.dart';

@freezed
class DeleteProjectResponse with _$DeleteProjectResponse {
  factory DeleteProjectResponse({
    required String message,
  }) = _DeleteProjectResponse;

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseFromJson(json);
}
