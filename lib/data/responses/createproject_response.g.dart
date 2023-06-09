// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createproject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateProjectResponse _$$_CreateProjectResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CreateProjectResponse(
      data: Project.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$$_CreateProjectResponseToJson(
        _$_CreateProjectResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
