// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfficesResponse _$$_OfficesResponseFromJson(Map<String, dynamic> json) =>
    _$_OfficesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Office.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OfficesResponseToJson(_$_OfficesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
