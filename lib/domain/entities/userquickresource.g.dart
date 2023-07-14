// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userquickresource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserQuickResource _$$_UserQuickResourceFromJson(Map<String, dynamic> json) =>
    _$_UserQuickResource(
      id: json['id'] as int,
      fullname: json['fullname'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_UserQuickResourceToJson(
        _$_UserQuickResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'image_url': instance.imageUrl,
    };
