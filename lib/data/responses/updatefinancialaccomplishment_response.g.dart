// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updatefinancialaccomplishment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFinancialAccomplishmentResponse
    _$UpdateFinancialAccomplishmentResponseFromJson(
            Map<String, dynamic> json) =>
        UpdateFinancialAccomplishmentResponse(
          data: json['data'] == null
              ? null
              : FinancialAccomplishment.fromJson(
                  json['data'] as Map<String, dynamic>),
          success: json['success'] as bool,
          message: json['message'] as String,
        );

Map<String, dynamic> _$UpdateFinancialAccomplishmentResponseToJson(
        UpdateFinancialAccomplishmentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
