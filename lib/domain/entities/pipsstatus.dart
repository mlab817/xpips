import 'package:freezed_annotation/freezed_annotation.dart';

part 'pipsstatus.freezed.dart';
part 'pipsstatus.g.dart';

@freezed
class PipsStatus with _$PipsStatus {
  factory PipsStatus({
    required int id,
    required String name,
    @JsonKey(name: "projects_count") required int projectsCount,
  }) = _PipsStatus;

  factory PipsStatus.fromJson(Map<String, dynamic> json) =>
      _$PipsStatusFromJson(json);
}
