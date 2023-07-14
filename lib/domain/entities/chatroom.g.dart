// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoom _$$_ChatRoomFromJson(Map<String, dynamic> json) => _$_ChatRoom(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      lastComment: json['last_comment'] == null
          ? null
          : Comment.fromJson(json['last_comment'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$_ChatRoomToJson(_$_ChatRoom instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'last_comment': instance.lastComment,
      'notes': instance.notes,
    };
