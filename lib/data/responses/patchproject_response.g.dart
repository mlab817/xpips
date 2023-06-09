// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patchproject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchProjectResponse _$PatchProjectResponseFromJson(
        Map<String, dynamic> json) =>
    PatchProjectResponse(
      message: json['message'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PatchProjectResponseToJson(
        PatchProjectResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
