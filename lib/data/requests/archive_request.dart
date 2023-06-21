import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_request.freezed.dart';
part 'archive_request.g.dart';

@freezed
class ArchiveRequest with _$ArchiveRequest {
  factory ArchiveRequest({
    @JsonKey(name: "per_page") required int perPage,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "q", includeIfNull: false) String? q,
  }) = _ArchiveRequest;

  factory ArchiveRequest.fromJson(Map<String, dynamic> json) =>
      _$ArchiveRequestFromJson(json);
}
