// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateprofile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateProfileRequest _$$_UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateProfileRequest(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      position: json['position'] as String,
      contactNumber: json['contact_number'] as String,
    );

Map<String, dynamic> _$$_UpdateProfileRequestToJson(
        _$_UpdateProfileRequest instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': instance.position,
      'contact_number': instance.contactNumber,
    };
