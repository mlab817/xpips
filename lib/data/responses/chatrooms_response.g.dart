// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatrooms_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoomsResponse _$$_ChatRoomsResponseFromJson(Map<String, dynamic> json) =>
    _$_ChatRoomsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatRoomsResponseToJson(
        _$_ChatRoomsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
