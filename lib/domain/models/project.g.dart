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
      notes: json['notes'] as String?,
      permissions:
          Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
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
      'notes': instance.notes,
      'permissions': instance.permissions,
    };

_$_Permissions _$$_PermissionsFromJson(Map<String, dynamic> json) =>
    _$_Permissions(
      view: json['view'] as bool,
      update: json['update'] as bool,
      delete: json['delete'] as bool,
      lock: json['lock'] as bool,
      unlock: json['unlock'] as bool,
      validate: json['validate'] as bool,
      drop: json['drop'] as bool,
      updatePipol: json['updatePipol'] as bool,
    );

Map<String, dynamic> _$$_PermissionsToJson(_$_Permissions instance) =>
    <String, dynamic>{
      'view': instance.view,
      'update': instance.update,
      'delete': instance.delete,
      'lock': instance.lock,
      'unlock': instance.unlock,
      'validate': instance.validate,
      'drop': instance.drop,
      'updatePipol': instance.updatePipol,
    };
