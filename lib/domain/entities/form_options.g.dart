// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormOptions _$FormOptionsFromJson(Map<String, dynamic> json) => FormOptions(
      agenda: (json['agenda'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      approvalLevels: (json['approval_levels'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      bases: (json['bases'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      cipTypes: (json['cip_types'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      fsStatuses: (json['fs_statuses'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      fundingInstitutions: (json['funding_institutions'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      fundingSources: (json['funding_sources'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      gads: (json['gads'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      implementationModes: (json['implementation_modes'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      infrastructureSectors: (json['infrastructure_sectors'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      offices: (json['offices'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      operatingUnits: (json['operating_units'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      pdpChapters: (json['pdp_chapters'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipolStatuses: (json['pipol_statuses'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipsStatuses: (json['pips_statuses'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      preparationDocuments: (json['preparation_documents'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      prerequisites: (json['prerequisites'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      prexcs: (json['prexcs'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      programs: (json['programs'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectStatuses: (json['project_statuses'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      provinces: (json['provinces'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      readinessLevels: (json['readiness_levels'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      regions: (json['regions'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      sdgs: (json['sdgs'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      spatialCoverages: (json['spatial_coverages'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      typologies: (json['typologies'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      years: (json['years'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      ouTypes: (json['ou_types'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachmentTypes: (json['attachment_types'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormOptionsToJson(FormOptions instance) =>
    <String, dynamic>{
      'agenda': instance.agenda,
      'approval_levels': instance.approvalLevels,
      'bases': instance.bases,
      'categories': instance.categories,
      'cip_types': instance.cipTypes,
      'fs_statuses': instance.fsStatuses,
      'funding_institutions': instance.fundingInstitutions,
      'funding_sources': instance.fundingSources,
      'gads': instance.gads,
      'implementation_modes': instance.implementationModes,
      'infrastructure_sectors': instance.infrastructureSectors,
      'offices': instance.offices,
      'operating_units': instance.operatingUnits,
      'pdp_chapters': instance.pdpChapters,
      'pipol_statuses': instance.pipolStatuses,
      'pips_statuses': instance.pipsStatuses,
      'preparation_documents': instance.preparationDocuments,
      'prerequisites': instance.prerequisites,
      'prexcs': instance.prexcs,
      'programs': instance.programs,
      'project_statuses': instance.projectStatuses,
      'provinces': instance.provinces,
      'readiness_levels': instance.readinessLevels,
      'regions': instance.regions,
      'roles': instance.roles,
      'sdgs': instance.sdgs,
      'spatial_coverages': instance.spatialCoverages,
      'types': instance.types,
      'typologies': instance.typologies,
      'years': instance.years,
      'ou_types': instance.ouTypes,
      'attachment_types': instance.attachmentTypes,
    };
