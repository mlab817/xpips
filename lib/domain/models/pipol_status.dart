import 'package:freezed_annotation/freezed_annotation.dart';

part 'pipol_status.freezed.dart';
part 'pipol_status.g.dart';

@freezed
class PipolStatus with _$PipolStatus {
  factory PipolStatus({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'projects_count') required int projectsCount,
  }) = _PipolStatus;

  factory PipolStatus.fromJson(Map<String, dynamic> json) =>
      _$PipolStatusFromJson(json);
}