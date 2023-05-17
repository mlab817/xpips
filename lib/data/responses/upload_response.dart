import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response.g.dart';

@JsonSerializable()
class UploadResponse {
  final String path;

  UploadResponse({
    required this.path,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadResponseToJson(this);
}
