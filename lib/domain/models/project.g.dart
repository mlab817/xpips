// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      totalCost: (json['total_cost'] as num?)?.toDouble(),
      isLocked: json['is_locked'] as bool,
      updatedAt: json['updated_at'] as String,
      pipolCode: json['pipol_code'] as String?,
      description: json['description'] as String?,
      spatialCoverage: json['spatial_coverage'] == null
          ? null
          : Option.fromJson(json['spatial_coverage'] as Map<String, dynamic>),
      office: json['office'] == null
          ? null
          : Office.fromJson(json['office'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      isRead: json['is_read'] as bool,
      contactInformation: json['contact_information'] as String?,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'total_cost': instance.totalCost,
      'is_locked': instance.isLocked,
      'updated_at': instance.updatedAt,
      'pipol_code': instance.pipolCode,
      'description': instance.description,
      'spatial_coverage': instance.spatialCoverage,
      'office': instance.office,
      'user': instance.user,
      'is_read': instance.isRead,
      'contact_information': instance.contactInformation,
    };
