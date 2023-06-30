// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Office _$$_OfficeFromJson(Map<String, dynamic> json) => _$_Office(
      id: json['id'] as int,
      name: json['name'] as String,
      acronym: json['acronym'] as String,
      uuid: json['uuid'] as String?,
      headName: json['head_name'] as String?,
      headPosition: json['head_position'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$$_OfficeToJson(_$_Office instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'acronym': instance.acronym,
      'uuid': instance.uuid,
      'head_name': instance.headName,
      'head_position': instance.headPosition,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
    };
