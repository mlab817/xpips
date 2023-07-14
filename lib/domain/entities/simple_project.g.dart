// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimpleProject _$$_SimpleProjectFromJson(Map<String, dynamic> json) =>
    _$_SimpleProject(
      title: json['title'] as String,
      type: json['type'] == null
          ? null
          : Option.fromJson(json['type'] as Map<String, dynamic>),
      regularProgram: json['regular_program'] as bool,
      bases: (json['bases'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      totalCost: (json['total_cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$_SimpleProjectToJson(_$_SimpleProject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'regular_program': instance.regularProgram,
      'bases': instance.bases,
      'description': instance.description,
      'total_cost': instance.totalCost,
    };
