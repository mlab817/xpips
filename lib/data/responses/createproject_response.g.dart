// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createproject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateProjectResponse _$$_CreateProjectResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CreateProjectResponse(
      data: FullProject.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_CreateProjectResponseToJson(
        _$_CreateProjectResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };
