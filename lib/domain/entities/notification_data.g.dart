// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationData _$$_NotificationDataFromJson(Map<String, dynamic> json) =>
    _$_NotificationData(
      sender: json['sender'] as String,
      subject: json['subject'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_NotificationDataToJson(_$_NotificationData instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'subject': instance.subject,
      'message': instance.message,
    };
