// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      uuid: json['uuid'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullname: json['fullname'] as String?,
      position: json['position'] as String?,
      contactNumber: json['contact_number'] as String?,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      office: json['office'] == null
          ? null
          : Office.fromJson(json['office'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullname': instance.fullname,
      'position': instance.position,
      'contact_number': instance.contactNumber,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'office': instance.office,
    };
