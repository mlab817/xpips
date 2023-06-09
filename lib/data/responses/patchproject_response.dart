import 'package:freezed_annotation/freezed_annotation.dart';

part 'patchproject_response.g.dart';

@JsonSerializable()
class PatchProjectResponse {
  final String message;

  final String status;

  PatchProjectResponse({
    required this.message,
    required this.status,
  });

  factory PatchProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$PatchProjectResponseFromJson(json);
}
