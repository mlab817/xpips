import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/fullproject.dart';

part 'updateproject_response.freezed.dart';
part 'updateproject_response.g.dart';

@freezed
class UpdateProjectResponse with _$UpdateProjectResponse {
  factory UpdateProjectResponse({
    required FullProject data,
    required String status,
  }) = _UpdateProjectResponse;

  factory UpdateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResponseFromJson(json);
}
