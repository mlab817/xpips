// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullproject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullProject _$$_FullProjectFromJson(Map<String, dynamic> json) =>
    _$_FullProject(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String?,
      typeId: json['type_id'] as int?,
      type: json['type'] == null
          ? null
          : Option.fromJson(json['type'] as Map<String, dynamic>),
      regularProgram: json['regular_program'] as bool?,
      description: json['description'] as String?,
      totalCost: (json['total_cost'] as num?)?.toDouble(),
      expectedOutputs: json['expected_outputs'] as String?,
      spatialCoverageId: json['spatial_coverage_id'] as int?,
      spatialCoverage: json['spatial_coverage'] == null
          ? null
          : Option.fromJson(json['spatial_coverage'] as Map<String, dynamic>),
      approvalLevelId: json['approval_level_id'] as int?,
      approvalLevel: json['approval_level'] == null
          ? null
          : Option.fromJson(json['approval_level'] as Map<String, dynamic>),
      approvalLevelDate: json['approval_level_date'] == null
          ? null
          : DateTime.parse(json['approval_level_date'] as String),
      pip: json['pip'] as bool?,
      typologyId: json['typology_id'] as int?,
      typology: json['typology'] == null
          ? null
          : Option.fromJson(json['typology'] as Map<String, dynamic>),
      cip: json['cip'] as bool?,
      iccable: json['iccable'] as bool?,
      cipTypeId: json['cip_type_id'] as int?,
      cipType: json['cip_type'] == null
          ? null
          : Option.fromJson(json['cip_type'] as Map<String, dynamic>),
      trip: json['trip'] as bool?,
      rdip: json['rdip'] as bool?,
      covid: json['covid'] as bool?,
      research: json['research'] as bool?,
      bases: (json['bases'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      operatingUnits: (json['operating_units'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      rdcEndorsementRequired: json['rdc_endorsement_required'] as bool?,
      pdpChapterId: json['pdp_chapter_id'] as int?,
      pdpChapter: json['pdp_chapter'] == null
          ? null
          : Option.fromJson(json['pdp_chapter'] as Map<String, dynamic>),
      pdpChapters: (json['pdp_chapters'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      risk: json['implementation_risk'] as String?,
      agenda: (json['agenda'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      sdgs: (json['sdgs'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      gadId: json['gad_id'] as int?,
      gad: json['gad'] == null
          ? null
          : Option.fromJson(json['gad'] as Map<String, dynamic>),
      preparationDocumentId: json['preparation_document_id'] as int?,
      preparationDocument: json['preparation_document'] == null
          ? null
          : Option.fromJson(
              json['preparation_document'] as Map<String, dynamic>),
      fsNeedsAssistance: json['fs_needs_assistance'] as bool?,
      fsStatusId: json['fs_status_id'] as int?,
      fsStatus: json['fs_status'] == null
          ? null
          : Option.fromJson(json['fs_status'] as Map<String, dynamic>),
      fsTotalCost: json['fs_total_cost'] as String?,
      fsCost: json['fs_cost'] == null
          ? null
          : CostSchedule.fromJson(json['fs_cost'] as Map<String, dynamic>),
      fsCompletionDate: json['fs_completion_date'] == null
          ? null
          : DateTime.parse(json['fs_completion_date'] as String),
      hasRow: json['has_row'] as bool?,
      rowAffectedHouseholds: json['row_affected_households'] as int?,
      rowTotalCost: (json['row_total_cost'] as num?)?.toDouble(),
      rowCost: json['row_cost'] == null
          ? null
          : CostSchedule.fromJson(json['row_cost'] as Map<String, dynamic>),
      hasRap: json['has_rap'] as bool?,
      rapAffectedHouseholds: json['rap_affected_households'] as int?,
      rapTotalCost: (json['rap_total_cost'] as num?)?.toDouble(),
      rapCost: json['rap_cost'] == null
          ? null
          : CostSchedule.fromJson(json['rap_cost'] as Map<String, dynamic>),
      hasRowRap: json['has_row_rap'] as bool?,
      prerequisites: (json['prerequisites'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      locations: (json['locations'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      infrastructureSectors: (json['infrastructure_sectors'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      fundingInstitutions: (json['funding_institutions'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      fundingSourceId: json['funding_source_id'] as int?,
      fundingSource: json['funding_source'] == null
          ? null
          : Option.fromJson(json['funding_source'] as Map<String, dynamic>),
      fundingSources: (json['funding_sources'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      implementationMode: json['implementation_mode'] == null
          ? null
          : Option.fromJson(
              json['implementation_mode'] as Map<String, dynamic>),
      pureGrant: json['pure_grant'] as bool?,
      fsInvestments: (json['fs_investments'] as List<dynamic>)
          .map((e) => FsInvestment.fromJson(e as Map<String, dynamic>))
          .toList(),
      regionalInvestments: (json['regional_investments'] as List<dynamic>)
          .map((e) => RegionalInvestment.fromJson(e as Map<String, dynamic>))
          .toList(),
      implementationModeId: json['implementation_mode_id'] as int?,
      projectStatusId: json['project_status_id'] as int?,
      categoryId: json['category_id'] as int?,
      category: json['category'] == null
          ? null
          : Option.fromJson(json['category'] as Map<String, dynamic>),
      readinessLevelId: json['readiness_level_id'] as int?,
      readinessLevel: json['readiness_level'] == null
          ? null
          : Option.fromJson(json['readiness_level'] as Map<String, dynamic>),
      startYearId: json['start_year_id'] as int?,
      startYear: json['start_year'] == null
          ? null
          : Option.fromJson(json['start_year'] as Map<String, dynamic>),
      endYearId: json['end_year_id'] as int?,
      endYear: json['end_year'] == null
          ? null
          : Option.fromJson(json['end_year'] as Map<String, dynamic>),
      updates: json['updates'] as String?,
      asOf: json['updates_as_of'] == null
          ? null
          : DateTime.parse(json['updates_as_of'] as String),
      employmentGenerated: json['employment_generated'] as int?,
      employedMale: json['employed_male'] as int?,
      employedFemale: json['employed_female'] as int?,
      projectStatus: json['project_status'] == null
          ? null
          : Option.fromJson(json['project_status'] as Map<String, dynamic>),
      office: json['office'] == null
          ? null
          : Office.fromJson(json['office'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      remarks: json['remarks'] as String?,
      uacsCode: json['uacs_code'] as String?,
      financialAccomplishment: json['financial_accomplishment'] == null
          ? null
          : FinancialAccomplishment.fromJson(
              json['financial_accomplishment'] as Map<String, dynamic>),
      contactInformation: json['contact_information'] as String?,
      notes: json['notes'] as String?,
      iccResubmission: json['icc_resubmission'] as bool?,
      regions: (json['regions'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      provinces: (json['provinces'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) =>
              UploadAttachmentResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipolCode: json['pipol_code'] as String?,
      pipolStatus: json['pipol_status'] == null
          ? null
          : Option.fromJson(json['pipol_status'] as Map<String, dynamic>),
      pipolUrl: json['pipol_url'] as String?,
      permissions:
          Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
      updatingPeriod: json['updating_period'] == null
          ? null
          : Option.fromJson(json['updating_period'] as Map<String, dynamic>),
      readonly: json['readonly'] as bool,
      outdated: json['outdated'] as bool,
    );

Map<String, dynamic> _$$_FullProjectToJson(_$_FullProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'type_id': instance.typeId,
      'type': instance.type,
      'regular_program': instance.regularProgram,
      'description': instance.description,
      'total_cost': instance.totalCost,
      'expected_outputs': instance.expectedOutputs,
      'spatial_coverage_id': instance.spatialCoverageId,
      'spatial_coverage': instance.spatialCoverage,
      'approval_level_id': instance.approvalLevelId,
      'approval_level_date': instance.approvalLevelDate?.toIso8601String(),
      'pip': instance.pip,
      'typology_id': instance.typologyId,
      'typology': instance.typology,
      'cip': instance.cip,
      'iccable': instance.iccable,
      'cip_type_id': instance.cipTypeId,
      'cip_type': instance.cipType,
      'trip': instance.trip,
      'rdip': instance.rdip,
      'covid': instance.covid,
      'research': instance.research,
      'bases': instance.bases,
      'operating_units': instance.operatingUnits,
      'rdc_endorsement_required': instance.rdcEndorsementRequired,
      'pdp_chapter_id': instance.pdpChapterId,
      'pdp_chapter': instance.pdpChapter,
      'pdp_chapters': instance.pdpChapters,
      'implementation_risk': instance.risk,
      'agenda': instance.agenda,
      'sdgs': instance.sdgs,
      'gad_id': instance.gadId,
      'gad': instance.gad,
      'preparation_document_id': instance.preparationDocumentId,
      'preparation_document': instance.preparationDocument,
      'fs_needs_assistance': instance.fsNeedsAssistance,
      'fs_status_id': instance.fsStatusId,
      'fs_status': instance.fsStatus,
      'fs_total_cost': instance.fsTotalCost,
      'fs_cost': instance.fsCost,
      'fs_completion_date': instance.fsCompletionDate?.toIso8601String(),
      'has_row': instance.hasRow,
      'row_affected_households': instance.rowAffectedHouseholds,
      'row_total_cost': instance.rowTotalCost,
      'row_cost': instance.rowCost,
      'has_rap': instance.hasRap,
      'rap_affected_households': instance.rapAffectedHouseholds,
      'rap_total_cost': instance.rapTotalCost,
      'rap_cost': instance.rapCost,
      'has_row_rap': instance.hasRowRap,
      'prerequisites': instance.prerequisites,
      'locations': instance.locations,
      'infrastructure_sectors': instance.infrastructureSectors,
      'funding_institutions': instance.fundingInstitutions,
      'funding_source_id': instance.fundingSourceId,
      'funding_source': instance.fundingSource,
      'funding_sources': instance.fundingSources,
      'implementation_mode': instance.implementationMode,
      'pure_grant': instance.pureGrant,
      'fs_investments': instance.fsInvestments,
      'regional_investments': instance.regionalInvestments,
      'implementation_mode_id': instance.implementationModeId,
      'project_status_id': instance.projectStatusId,
      'category_id': instance.categoryId,
      'category': instance.category,
      'readiness_level_id': instance.readinessLevelId,
      'readiness_level': instance.readinessLevel,
      'start_year_id': instance.startYearId,
      'start_year': instance.startYear,
      'end_year_id': instance.endYearId,
      'end_year': instance.endYear,
      'updates': instance.updates,
      'updates_as_of': instance.asOf?.toIso8601String(),
      'employment_generated': instance.employmentGenerated,
      'employed_male': instance.employedMale,
      'employed_female': instance.employedFemale,
      'project_status': instance.projectStatus,
      'office': instance.office,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user': instance.user,
      'remarks': instance.remarks,
      'uacs_code': instance.uacsCode,
      'financial_accomplishment': instance.financialAccomplishment,
      'contact_information': instance.contactInformation,
      'notes': instance.notes,
      'icc_resubmission': instance.iccResubmission,
      'regions': instance.regions,
      'provinces': instance.provinces,
      'attachments': instance.attachments,
      'pipol_code': instance.pipolCode,
      'pipol_status': instance.pipolStatus,
      'pipol_url': instance.pipolUrl,
      'permissions': instance.permissions,
      'updating_period': instance.updatingPeriod,
      'readonly': instance.readonly,
      'outdated': instance.outdated,
    };
