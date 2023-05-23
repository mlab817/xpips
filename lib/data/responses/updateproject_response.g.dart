// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateproject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateProjectResponse _$$_UpdateProjectResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateProjectResponse(
      data: FullProject.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_UpdateProjectResponseToJson(
        _$_UpdateProjectResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };
