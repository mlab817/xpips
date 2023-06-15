// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploadattachment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAttachmentResponse _$UploadAttachmentResponseFromJson(
        Map<String, dynamic> json) =>
    UploadAttachmentResponse(
      data: UploadAttachmentResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadAttachmentResponseToJson(
        UploadAttachmentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UploadAttachmentResponseData _$UploadAttachmentResponseDataFromJson(
        Map<String, dynamic> json) =>
    UploadAttachmentResponseData(
      url: json['url'] as String,
      attachmentType:
          Option.fromJson(json['attachment_type'] as Map<String, dynamic>),
      attachmentUrl: json['attachment_url'] as String,
    );

Map<String, dynamic> _$UploadAttachmentResponseDataToJson(
        UploadAttachmentResponseData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'attachment_url': instance.attachmentUrl,
      'attachment_type': instance.attachmentType,
    };
