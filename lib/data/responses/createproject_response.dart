import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/models.dart';

part 'createproject_response.freezed.dart';
part 'createproject_response.g.dart';

@freezed
class CreateProjectResponse with _$CreateProjectResponse {
  factory CreateProjectResponse({
    required Project data,
    required String message,
    required bool success,
  }) = _CreateProjectResponse;

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}
