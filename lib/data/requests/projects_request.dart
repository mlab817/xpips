import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects_request.freezed.dart';
part 'projects_request.g.dart';

@freezed
class ProjectsRequest with _$ProjectsRequest {
  factory ProjectsRequest({
    @JsonKey(name: "per_page") required int perPage,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "q", includeIfNull: false) String? q,
    @JsonKey(name: "types[]", includeIfNull: false) List<int>? types,
    @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
    List<int>? spatialCoverages,
    @JsonKey(name: "pip", includeIfNull: false) bool? pip,
    @JsonKey(name: "cip", includeIfNull: false) bool? cip,
    @JsonKey(name: "trip", includeIfNull: false) bool? trip,
    @JsonKey(name: "rdip", includeIfNull: false) bool? rdip,
    @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
    List<int>? pdpChapters,
    @JsonKey(name: "project_statuses[]", includeIfNull: false)
    List<int>? projectStatuses,
    @JsonKey(name: "categories[]", includeIfNull: false) List<int>? categories,
    @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
    List<int>? pipolStatuses,
    @JsonKey(name: "pips_statuses[]", includeIfNull: false)
    List<int>? pipsStatuses,
    @JsonKey(name: "offices[]", includeIfNull: false) List<int>? offices,
    @JsonKey(name: "funding_sources[]", includeIfNull: false)
    List<int>? fundingSources,
    @JsonKey(name: "sort") String? sort,
  }) = _ProjectsRequest;

  factory ProjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$ProjectsRequestFromJson(json);

  static ProjectsRequest initial() {
    return ProjectsRequest(
      perPage: 1,
      page: 25,
    );
  }
}
