// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusResponse _$StatusResponseFromJson(Map<String, dynamic> json) =>
    StatusResponse(
      status: json['status'] as String?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StatusResponseToJson(StatusResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': instance.message,
    };

RegionalInvestmentResponse _$RegionalInvestmentResponseFromJson(
        Map<String, dynamic> json) =>
    RegionalInvestmentResponse(
      data: RegionalInvestment.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..success = json['success'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RegionalInvestmentResponseToJson(
        RegionalInvestmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

FsInvestmentResponse _$FsInvestmentResponseFromJson(
        Map<String, dynamic> json) =>
    FsInvestmentResponse(
      data: FsInvestment.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..success = json['success'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$FsInvestmentResponseToJson(
        FsInvestmentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
