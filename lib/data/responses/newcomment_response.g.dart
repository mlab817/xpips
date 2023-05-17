// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newcomment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewCommentResponse _$$_NewCommentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_NewCommentResponse(
      data: Comment.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_NewCommentResponseToJson(
        _$_NewCommentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
