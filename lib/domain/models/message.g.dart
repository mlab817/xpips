// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as int,
      content: json['content'] as String,
      chatRoomId: json['chat_room_id'] as int,
      senderId: json['sender_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'chat_room_id': instance.chatRoomId,
      'sender_id': instance.senderId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
