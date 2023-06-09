import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/data/responses/uploadattachment_response.dart';

import 'models.dart';

part 'fullproject.freezed.dart';
part 'fullproject.g.dart';

@freezed
class FullProject with _$FullProject {
  factory FullProject({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "uuid") required String uuid,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "type_id") int? typeId,
    @JsonKey(name: "type") Option? type,
    @JsonKey(name: "regular_program") bool? regularProgram,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "total_cost") double? totalCost,
    @JsonKey(name: "expected_outputs") String? expectedOutputs,
    @JsonKey(name: "spatial_coverage_id") int? spatialCoverageId,
    @JsonKey(name: "spatial_coverage") Option? spatialCoverage,
    @JsonKey(name: "approval_level_id") int? approvalLevelId,
    @JsonKey(name: "approval_level", includeToJson: false)
    Option? approvalLevel,
    @JsonKey(name: "approval_level_date") DateTime? approvalLevelDate,
    @JsonKey(name: "pip") bool? pip,
    @JsonKey(name: "typology_id") int? typologyId,
    @JsonKey(name: "typology") Option? typology,
    @JsonKey(name: "cip") bool? cip,
    @JsonKey(name: "iccable") bool? iccable,
    @JsonKey(name: "cip_type_id") int? cipTypeId,
    @JsonKey(name: "cip_type") Option? cipType,
    @JsonKey(name: "trip") bool? trip,
    @JsonKey(name: "rdip") bool? rdip,
    @JsonKey(name: "covid") bool? covid,
    @JsonKey(name: "research") bool? research,
    @JsonKey(name: "bases") required List<Option> bases,
    @JsonKey(name: "operating_units") required List<Option> operatingUnits,
    @JsonKey(name: "rdc_endorsement_required") bool? rdcEndorsementRequired,
    @JsonKey(name: "pdp_chapter_id") int? pdpChapterId,
    @JsonKey(name: "pdp_chapter") Option? pdpChapter,
    @JsonKey(name: "pdp_chapters") required List<Option> pdpChapters,
    @JsonKey(name: "implementation_risk") String? risk,
    @JsonKey(name: "agenda") required List<Option> agenda,
    @JsonKey(name: "sdgs") required List<Option> sdgs,
    @JsonKey(name: "gad_id") int? gadId,
    @JsonKey(name: "gad") Option? gad,
    @JsonKey(name: "preparation_document_id") int? preparationDocumentId,
    @JsonKey(name: "preparation_document") Option? preparationDocument,
    @JsonKey(name: "fs_needs_assistance") bool? fsNeedsAssistance,
    @JsonKey(name: "fs_status_id") int? fsStatusId,
    @JsonKey(name: "fs_status") Option? fsStatus,
    @JsonKey(name: "fs_total_cost") String? fsTotalCost,
    @JsonKey(name: "fs_cost") CostSchedule? fsCost,
    @JsonKey(name: "fs_completion_date") DateTime? fsCompletionDate,
    @JsonKey(name: "has_row") bool? hasRow,
    @JsonKey(name: "row_affected_households") int? rowAffectedHouseholds,
    @JsonKey(name: "row_total_cost") double? rowTotalCost,
    @JsonKey(name: "row_cost") CostSchedule? rowCost,
    @JsonKey(name: "has_rap") bool? hasRap,
    @JsonKey(name: "rap_affected_households") int? rapAffectedHouseholds,
    @JsonKey(name: "rap_total_cost") double? rapTotalCost,
    @JsonKey(name: "rap_cost") CostSchedule? rapCost,
    @JsonKey(name: "has_row_rap") bool? hasRowRap,
    @JsonKey(name: "prerequisites") required List<Option> prerequisites,
    @JsonKey(name: "locations") required List<Option> locations,
    @JsonKey(name: "infrastructure_sectors")
    required List<Option> infrastructureSectors,
    @JsonKey(name: "funding_institutions")
    required List<Option> fundingInstitutions,
    @JsonKey(name: "funding_source_id") int? fundingSourceId,
    @JsonKey(name: "funding_source") Option? fundingSource,
    @JsonKey(name: "funding_sources") required List<Option> fundingSources,
    @JsonKey(name: "implementation_mode") Option? implementationMode,
    @JsonKey(name: "pure_grant") bool? pureGrant,
    @JsonKey(name: "fs_investments") required List<FsInvestment> fsInvestments,
    @JsonKey(name: "regional_investments")
    required List<RegionalInvestment> regionalInvestments,
    @JsonKey(name: "implementation_mode_id") int? implementationModeId,
    @JsonKey(name: "project_status_id") int? projectStatusId,
    @JsonKey(name: "category_id") int? categoryId,
    @JsonKey(name: "category") Option? category,
    @JsonKey(name: "readiness_level_id") int? readinessLevelId,
    @JsonKey(name: "readiness_level") Option? readinessLevel,
    @JsonKey(name: "start_year_id") int? startYearId,
    @JsonKey(name: "start_year") Option? startYear,
    @JsonKey(name: "end_year_id") int? endYearId,
    @JsonKey(name: "end_year") Option? endYear,
    @JsonKey(name: "updates") String? updates,
    @JsonKey(name: "updates_as_of") DateTime? asOf,
    @JsonKey(name: "employment_generated") int? employmentGenerated,
    @JsonKey(name: "employed_male") int? employedMale,
    @JsonKey(name: "employed_female") int? employedFemale,
    @JsonKey(name: "project_status") Option? projectStatus,
    @JsonKey(name: "office") Office? office,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "user") User? user,
    @JsonKey(name: "remarks") String? remarks,
    @JsonKey(name: "uacs_code") String? uacsCode,
    @JsonKey(name: "financial_accomplishment")
    FinancialAccomplishment? financialAccomplishment,
    @JsonKey(name: "contact_information") String? contactInformation,
    @JsonKey(name: "notes") String? notes,
    @JsonKey(name: "icc_resubmission") bool? iccResubmission,
    @JsonKey(name: "regions") required List<Option> regions,
    @JsonKey(name: "provinces") required List<Option> provinces,
    @JsonKey(name: "attachments")
    required List<UploadAttachmentResponseData> attachments,
    @JsonKey(name: "pipol_code") String? pipolCode,
    @JsonKey(name: "pipol_status") Option? pipolStatus,
    @JsonKey(name: "pipol_url") String? pipolUrl,
    @JsonKey(name: "permissions") required Permissions permissions,
    @JsonKey(name: "updating_period") Option? updatingPeriod,
    required bool readonly,
    required bool outdated,
  }) = _FullProject;

  factory FullProject.fromJson(Map<String, Object?> json) =>
      _$FullProjectFromJson(json);

  bool get isValid {
    if (title == null || title!.isEmpty) return false;

    if (type == null) return false;

    if (bases.isEmpty) return false;

    if (description == null || description!.isEmpty) return false;

    if (totalCost == 0) return false;

    if (office == null) return false;

    if (operatingUnits.isEmpty) return false;

    if (expectedOutputs == null || expectedOutputs!.isEmpty) return false;

    if (pdpChapter == null) return false;

    return true;
  }

  FullProject._();
}
