// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notifications _$$_NotificationsFromJson(Map<String, dynamic> json) =>
    _$_Notifications(
      id: json['id'] as String,
      data: NotificationData.fromJson(json['data'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
    );

Map<String, dynamic> _$$_NotificationsToJson(_$_Notifications instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'created_at': instance.createdAt,
      'read_at': instance.readAt?.toIso8601String(),
    };
