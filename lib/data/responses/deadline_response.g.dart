// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deadline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeadlineResponse _$DeadlineResponseFromJson(Map<String, dynamic> json) =>
    DeadlineResponse(
      start: DateTime.parse(json['start'] as String),
      deadline: DateTime.parse(json['deadline'] as String),
      open: json['open'] as bool,
      serverTime: DateTime.parse(json['server_time'] as String),
      hasPassed: json['has_passed'] as bool,
      remaining: json['remaining'] as String,
    );

Map<String, dynamic> _$DeadlineResponseToJson(DeadlineResponse instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
      'open': instance.open,
      'server_time': instance.serverTime.toIso8601String(),
      'has_passed': instance.hasPassed,
      'remaining': instance.remaining,
    };
