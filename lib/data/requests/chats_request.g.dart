// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatsRequest _$$_ChatsRequestFromJson(Map<String, dynamic> json) =>
    _$_ChatsRequest(
      perPage: json['per_page'] as int,
      page: json['page'] as int,
      q: json['q'] as String?,
    );

Map<String, dynamic> _$$_ChatsRequestToJson(_$_ChatsRequest instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'page': instance.page,
      'q': instance.q,
    };
