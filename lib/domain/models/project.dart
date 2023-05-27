import 'package:freezed_annotation/freezed_annotation.dart';

import 'office.dart';
import 'option.dart';
import 'user.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    @JsonKey(name: "uuid") required String uuid,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "total_cost") required double? totalCost,
    @JsonKey(name: "is_locked") required bool isLocked,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "pipol_code") required String? pipolCode,
    @JsonKey(name: "description") required String? description,
    @JsonKey(name: "spatial_coverage") required Option? spatialCoverage,
    @JsonKey(name: "office") required Office? office,
    @JsonKey(name: "user") required User? user,
    @JsonKey(name: "is_read") required bool isRead,
    @JsonKey(name: "contact_information") String? contactInformation,
    @JsonKey(name: "notes") String? notes,
    @JsonKey(name: "permissions") required Permissions permissions,
    @JsonKey(name: "comments_count") required int commentsCount,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
class Permissions with _$Permissions {
  factory Permissions({
    required bool view,
    required bool update,
    required bool delete,
    required bool lock,
    required bool unlock,
    required bool validate,
    required bool drop,
    required bool updatePipol,
  }) = _Permissions;

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);
}
