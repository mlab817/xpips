// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateprofile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateProfileResponse _$$_UpdateProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateProfileResponse(
      success: json['success'] as bool,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UpdateProfileResponseToJson(
        _$_UpdateProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
    };
