// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updatepassword_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdatePasswordRequest _$$_UpdatePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    _$_UpdatePasswordRequest(
      currentPassword: json['current_password'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$$_UpdatePasswordRequestToJson(
        _$_UpdatePasswordRequest instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
