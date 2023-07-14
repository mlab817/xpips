import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/entities/fullproject.dart';

part 'project_response.freezed.dart';
part 'project_response.g.dart';

@freezed
class ProjectResponse with _$ProjectResponse {
  factory ProjectResponse({
    required FullProject project,
  }) = _ProjectResponse;

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);
}
