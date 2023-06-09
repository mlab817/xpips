// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newproject_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewProjectRequest _$NewProjectRequestFromJson(Map<String, dynamic> json) =>
    NewProjectRequest(
      title: json['title'] as String,
      typeId: json['type_id'] as int,
      regularProgram: json['regular_program'] as bool,
      bases: (json['bases'] as List<dynamic>).map((e) => e as int).toList(),
      description: json['description'] as String,
      totalCost: (json['total_cost'] as num).toDouble(),
    );

Map<String, dynamic> _$NewProjectRequestToJson(NewProjectRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type_id': instance.typeId,
      'regular_program': instance.regularProgram,
      'bases': instance.bases,
      'description': instance.description,
      'total_cost': instance.totalCost,
    };
