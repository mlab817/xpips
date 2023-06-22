// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EvaluationReport _$$_EvaluationReportFromJson(Map<String, dynamic> json) =>
    _$_EvaluationReport(
      projectId: json['project_id'] as int?,
      title: json['title'] as String?,
      fundingSources: json['funding_sources'] as String?,
      implementingUnits: json['implementing_units'] as String?,
      background: json['background'] as String?,
      rationale: json['rationale'] as String?,
      objectives: json['objectives'] as String?,
      beneficiaries: json['beneficiaries'] as String?,
      spatialCoverage: json['spatial_coverage'] as String?,
      components: json['components'] as String?,
      budgetEstimate: json['budget_estimate'] as String?,
      implementationPeriod: json['implementation_period'] as String?,
      responsiveness: json['responsiveness'] as String?,
      responsivenessSdgs: json['responsiveness_sdgs'] as String?,
      responsivenessAgenda: json['responsiveness_agenda'] as String?,
      responsivenessPdp: json['responsiveness_pdp'] as String?,
      responsivenessNafmip: json['responsiveness_nafmip'] as String?,
      responsivenessPbp: json['responsiveness_pbp'] as String?,
      readiness: json['readiness'] as String?,
      typology: json['typology'] as String?,
      otherComments: json['other_comments'] as String?,
      recommendingApproval: json['recommending_approval'] as bool?,
      otherRecommendations: json['other_recommendations'] as String?,
    );

Map<String, dynamic> _$$_EvaluationReportToJson(_$_EvaluationReport instance) =>
    <String, dynamic>{
      'project_id': instance.projectId,
      'title': instance.title,
      'funding_sources': instance.fundingSources,
      'implementing_units': instance.implementingUnits,
      'background': instance.background,
      'rationale': instance.rationale,
      'objectives': instance.objectives,
      'beneficiaries': instance.beneficiaries,
      'spatial_coverage': instance.spatialCoverage,
      'components': instance.components,
      'budget_estimate': instance.budgetEstimate,
      'implementation_period': instance.implementationPeriod,
      'responsiveness': instance.responsiveness,
      'responsiveness_sdgs': instance.responsivenessSdgs,
      'responsiveness_agenda': instance.responsivenessAgenda,
      'responsiveness_pdp': instance.responsivenessPdp,
      'responsiveness_nafmip': instance.responsivenessNafmip,
      'responsiveness_pbp': instance.responsivenessPbp,
      'readiness': instance.readiness,
      'typology': instance.typology,
      'other_comments': instance.otherComments,
      'recommending_approval': instance.recommendingApproval,
      'other_recommendations': instance.otherRecommendations,
    };
