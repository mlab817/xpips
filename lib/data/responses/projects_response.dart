import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/meta.dart';
import '../../domain/models/project.dart';

part 'projects_response.freezed.dart';
part 'projects_response.g.dart';

@freezed
class ProjectsResponse with _$ProjectsResponse {
  factory ProjectsResponse({
    @JsonKey(name: "data") required List<Project> data,
    @JsonKey(name: "meta") required Meta meta,
  }) = _ProjectsResponse;

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsResponseFromJson(json);
}
