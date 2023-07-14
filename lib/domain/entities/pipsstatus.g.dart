// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipsstatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PipsStatus _$$_PipsStatusFromJson(Map<String, dynamic> json) =>
    _$_PipsStatus(
      id: json['id'] as int,
      name: json['name'] as String,
      projectsCount: json['projects_count'] as int,
    );

Map<String, dynamic> _$$_PipsStatusToJson(_$_PipsStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projects_count': instance.projectsCount,
    };
