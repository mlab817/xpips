// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipol_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PipolStatus _$$_PipolStatusFromJson(Map<String, dynamic> json) =>
    _$_PipolStatus(
      id: json['id'] as int,
      name: json['name'] as String,
      projectsCount: json['projects_count'] as int,
    );

Map<String, dynamic> _$$_PipolStatusToJson(_$_PipolStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projects_count': instance.projectsCount,
    };
