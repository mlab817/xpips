// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoom _$$_ChatRoomFromJson(Map<String, dynamic> json) => _$_ChatRoom(
      id: json['id'] as int,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessage: json['last_message'] == null
          ? null
          : Message.fromJson(json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatRoomToJson(_$_ChatRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'users': instance.users,
      'messages': instance.messages,
      'last_message': instance.lastMessage,
    };
