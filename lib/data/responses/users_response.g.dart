// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UsersResponse _$$_UsersResponseFromJson(Map<String, dynamic> json) =>
    _$_UsersResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UsersResponseToJson(_$_UsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
