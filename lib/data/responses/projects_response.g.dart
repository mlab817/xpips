// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectsResponse _$$_ProjectsResponseFromJson(Map<String, dynamic> json) =>
    _$_ProjectsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProjectsResponseToJson(_$_ProjectsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
