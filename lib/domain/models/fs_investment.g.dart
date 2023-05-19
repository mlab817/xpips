// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fs_investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FsInvestment _$$_FsInvestmentFromJson(Map<String, dynamic> json) =>
    _$_FsInvestment(
      fundingSourceId: json['funding_source_id'] as int?,
      fundingSource: json['funding_source'] == null
          ? null
          : Option.fromJson(json['funding_source'] as Map<String, dynamic>),
      y2022: (json['y2022'] as num?)?.toDouble(),
      y2023: (json['y2023'] as num?)?.toDouble(),
      y2024: (json['y2024'] as num?)?.toDouble(),
      y2025: (json['y2025'] as num?)?.toDouble(),
      y2026: (json['y2026'] as num?)?.toDouble(),
      y2027: (json['y2027'] as num?)?.toDouble(),
      y2028: (json['y2028'] as num?)?.toDouble(),
      y2029: (json['y2029'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FsInvestmentToJson(_$_FsInvestment instance) =>
    <String, dynamic>{
      'funding_source_id': instance.fundingSourceId,
      'funding_source': instance.fundingSource,
      'y2022': instance.y2022,
      'y2023': instance.y2023,
      'y2024': instance.y2024,
      'y2025': instance.y2025,
      'y2026': instance.y2026,
      'y2027': instance.y2027,
      'y2028': instance.y2028,
      'y2029': instance.y2029,
    };
