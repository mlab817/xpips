// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentsResponse _$$_CommentsResponseFromJson(Map<String, dynamic> json) =>
    _$_CommentsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CommentsResponseToJson(_$_CommentsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
