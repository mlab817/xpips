import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/option.dart';

part 'uploadattachment_response.g.dart';

@JsonSerializable()
class UploadAttachmentResponse {
  @JsonKey(name: 'data')
  final UploadAttachmentResponseData data;

  UploadAttachmentResponse({
    required this.data,
  });

  factory UploadAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadAttachmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAttachmentResponseToJson(this);
}

@JsonSerializable()
class UploadAttachmentResponseData {
  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'attachment_type')
  final Option attachmentType;

  UploadAttachmentResponseData({
    required this.url,
    required this.attachmentType,
  });

  factory UploadAttachmentResponseData.fromJson(Map<String, dynamic> json) =>
      _$UploadAttachmentResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAttachmentResponseDataToJson(this);
}
