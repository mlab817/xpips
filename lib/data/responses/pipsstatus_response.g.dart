// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipsstatus_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PipsStatusResponse _$$_PipsStatusResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PipsStatusResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => PipsStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PipsStatusResponseToJson(
        _$_PipsStatusResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
