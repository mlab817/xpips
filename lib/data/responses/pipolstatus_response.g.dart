// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipolstatus_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PipolStatusResponse _$$_PipolStatusResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PipolStatusResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => PipolStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PipolStatusResponseToJson(
        _$_PipolStatusResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
