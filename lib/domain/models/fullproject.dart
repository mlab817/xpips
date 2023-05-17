import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/models/user.dart';

import 'office.dart';
import 'option.dart';

part 'fullproject.freezed.dart';
part 'fullproject.g.dart';

@freezed
class FullProject with _$FullProject {
  factory FullProject({
    @JsonKey(name: "id")
        int? id,
    @JsonKey(name: "uuid")
        String? uuid,
    @JsonKey(name: "title")
        String? title,
    @JsonKey(name: "type_id")
        int? typeId,
    @JsonKey(name: "type")
        Option? type,
    @JsonKey(name: "regular_program")
        bool? regularProgram,
    @JsonKey(name: "description")
        String? description,
    @JsonKey(name: "total_cost")
        double? totalCost,
    @JsonKey(name: "expected_outputs")
        String? expectedOutputs,
    @JsonKey(name: "spatial_coverage_id")
        int? spatialCoverageId,
    @JsonKey(name: "spatial_coverage")
        Option? spatialCoverage,
    @JsonKey(name: "approval_level_id")
        int? approvalLevelId,
    @JsonKey(name: "approval_level", includeToJson: false)
        Option? approvalLevel,
    @JsonKey(name: "approval_level_date")
        DateTime? approvalLevelDate,
    @JsonKey(name: "pip")
        bool? pip,
    @JsonKey(name: "typology_id")
        int? typologyId,
    @JsonKey(name: "typology")
        Option? typology,
    @JsonKey(name: "cip")
        bool? cip,
    @JsonKey(name: "iccable")
        bool? iccable,
    @JsonKey(name: "cip_type_id")
        int? cipTypeId,
    @JsonKey(name: "cip_type")
        Option? cipType,
    @JsonKey(name: "trip")
        bool? trip,
    @JsonKey(name: "rdip")
        bool? rdip,
    @JsonKey(name: "covid")
        bool? covid,
    @JsonKey(name: "research")
        bool? research,
    @JsonKey(name: "bases")
        required List<Option> bases,
    @JsonKey(name: "operating_units")
        required List<Option> operatingUnits,
    @JsonKey(name: "rdc_endorsement_required")
        bool? rdcEndorsementRequired,
    @JsonKey(name: "pdp_chapter_id")
        int? pdpChapterId,
    @JsonKey(name: "pdp_chapter")
        Option? pdpChapter,
    @JsonKey(name: "pdp_chapters")
        required List<Option> pdpChapters,
    @JsonKey(name: "risk")
        String? risk,
    @JsonKey(name: "agenda")
        required List<Option> agenda,
    @JsonKey(name: "sdgs")
        required List<Option> sdgs,
    @JsonKey(name: "gad_id")
        int? gadId,
    @JsonKey(name: "gad")
        Option? gad,
    @JsonKey(name: "preparation_document_id")
        int? preparationDocumentId,
    @JsonKey(name: "preparation_document")
        Option? preparationDocument,
    @JsonKey(name: "fs_needs_assistance")
        bool? fsNeedsAssistance,
    @JsonKey(name: "fs_status_id")
        int? fsStatusId,
    @JsonKey(name: "fs_status")
        Option? fsStatus,
    @JsonKey(name: "fs_total_cost")
        String? fsTotalCost,
    @JsonKey(name: "fs_cost")
        FsCost? fsCost,
    @JsonKey(name: "fs_completion_date")
        DateTime? fsCompletionDate,
    @JsonKey(name: "has_row")
        bool? hasRow,
    @JsonKey(name: "row_affected_households")
        int? rowAffectedHouseholds,
    @JsonKey(name: "row_total_cost")
        double? rowTotalCost,
    @JsonKey(name: "row_cost")
        RowCost? rowCost,
    @JsonKey(name: "has_rap")
        bool? hasRap,
    @JsonKey(name: "rap_affected_households")
        int? rapAffectedHouseholds,
    @JsonKey(name: "rap_total_cost")
        double? rapTotalCost,
    @JsonKey(name: "rap_cost")
        RapCost? rapCost,
    @JsonKey(name: "has_row_rap")
        bool? hasRowRap,
    @JsonKey(name: "prerequisites")
        required List<Option> prerequisites,
    @JsonKey(name: "locations")
        required List<Option> locations,
    @JsonKey(name: "infrastructure_sectors")
        required List<Option> infrastructureSectors,
    @JsonKey(name: "funding_institutions")
        required List<Option> fundingInstitutions,
    @JsonKey(name: "funding_source_id")
        int? fundingSourceId,
    @JsonKey(name: "funding_source")
        Option? fundingSource,
    @JsonKey(name: "funding_sources")
        required List<Option> fundingSources,
    @JsonKey(name: "implementation_mode")
        Option? implementationMode,
    @JsonKey(name: "pure_grant")
        bool? pureGrant,
    @JsonKey(name: "fs_investments")
        required List<FsInvestment> fsInvestments,
    @JsonKey(name: "regions")
        required List<RegionalInvestment> regions,
    @JsonKey(name: "implementation_mode_id")
        int? implementationModeId,
    @JsonKey(name: "project_status_id")
        int? projectStatusId,
    @JsonKey(name: "category_id")
        int? categoryId,
    @JsonKey(name: "category")
        Option? category,
    @JsonKey(name: "readiness_level_id")
        int? readinessLevelId,
    @JsonKey(name: "readiness_level")
        Option? readinessLevel,
    @JsonKey(name: "start_year_id")
        int? startYearId,
    @JsonKey(name: "start_year")
        Option? startYear,
    @JsonKey(name: "end_year_id")
        int? endYearId,
    @JsonKey(name: "end_year")
        Option? endYear,
    @JsonKey(name: "updates")
        String? updates,
    @JsonKey(name: "updates_as_of")
        DateTime? asOf,
    @JsonKey(name: "employment_generated")
        int? employmentGenerated,
    @JsonKey(name: "employed_male")
        int? employedMale,
    @JsonKey(name: "employed_female")
        int? employedFemale,
    @JsonKey(name: "project_status")
        Option? projectStatus,
    @JsonKey(name: "office")
        Office? office,
    @JsonKey(name: "updated_at")
        DateTime? updatedAt,
    @JsonKey(name: "user")
        User? user,
    @JsonKey(name: "remarks")
        String? remarks,
    @JsonKey(name: "uacs_code")
        String? uacsCode,
    @JsonKey(name: "financial_accomplishment")
        required FinancialAccomplishment financialAccomplishment,
    @JsonKey(name: "contact_information")
        String? contactInformation,
    @JsonKey(name: "notes")
        String? notes,
  }) = _FullProject;

  factory FullProject.fromJson(Map<String, Object?> json) =>
      _$FullProjectFromJson(json);
}

@freezed
class FsInvestment with _$FsInvestment {
  factory FsInvestment({
    @JsonKey(name: "funding_source_id") int? fundingSourceId,
    @JsonKey(name: "funding_source") Option? fundingSource,
    @JsonKey(name: "y2022") double? y2022,
    @JsonKey(name: "y2023") double? y2023,
    @JsonKey(name: "y2024") double? y2024,
    @JsonKey(name: "y2025") double? y2025,
    @JsonKey(name: "y2026") double? y2026,
    @JsonKey(name: "y2027") double? y2027,
    @JsonKey(name: "y2028") double? y2028,
    @JsonKey(name: "y2029") double? y2029,
  }) = _FsInvestment;

  factory FsInvestment.fromJson(Map<String, dynamic> json) =>
      _$FsInvestmentFromJson(json);

  // dump regional investment
  @override
  String toString() {
    return jsonEncode(this);
  }
}

extension RegionalInvestmentTotal on RegionalInvestment {
  double total() {
    return (y2022 ?? 0) +
        (y2023 ?? 0) +
        (y2024 ?? 0) +
        (y2025 ?? 0) +
        (y2026 ?? 0) +
        (y2027 ?? 0) +
        (y2028 ?? 0) +
        (y2029 ?? 0);
  }
}

extension FsInvestmentTotal on FsInvestment {
  double total() {
    return (y2022 ?? 0) +
        (y2023 ?? 0) +
        (y2024 ?? 0) +
        (y2025 ?? 0) +
        (y2026 ?? 0) +
        (y2027 ?? 0) +
        (y2028 ?? 0) +
        (y2029 ?? 0);
  }
}

@freezed
class RegionalInvestment with _$RegionalInvestment {
  factory RegionalInvestment({
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "region") Option? region,
    @JsonKey(name: "y2022") double? y2022,
    @JsonKey(name: "y2023") double? y2023,
    @JsonKey(name: "y2024") double? y2024,
    @JsonKey(name: "y2025") double? y2025,
    @JsonKey(name: "y2026") double? y2026,
    @JsonKey(name: "y2027") double? y2027,
    @JsonKey(name: "y2028") double? y2028,
    @JsonKey(name: "y2029") double? y2029,
  }) = _RegionalInvestment;

  factory RegionalInvestment.fromJson(Map<String, dynamic> json) =>
      _$RegionalInvestmentFromJson(json);

  // dump regional investment
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@freezed
class FinancialAccomplishment with _$FinancialAccomplishment {
  factory FinancialAccomplishment({
    @JsonKey(name: "nep_2023") num? nep2023,
    @JsonKey(name: "nep_2024") num? nep2024,
    @JsonKey(name: "nep_2025") num? nep2025,
    @JsonKey(name: "nep_2026") num? nep2026,
    @JsonKey(name: "nep_2027") num? nep2027,
    @JsonKey(name: "nep_2028") num? nep2028,
    @JsonKey(name: "gaa_2023") num? gaa2023,
    @JsonKey(name: "gaa_2024") num? gaa2024,
    @JsonKey(name: "gaa_2025") num? gaa2025,
    @JsonKey(name: "gaa_2026") num? gaa2026,
    @JsonKey(name: "gaa_2027") num? gaa2027,
    @JsonKey(name: "gaa_2028") num? gaa2028,
    @JsonKey(name: "disbursement_2023") num? disbursement2023,
    @JsonKey(name: "disbursement_2024") num? disbursement2024,
    @JsonKey(name: "disbursement_2025") num? disbursement2025,
    @JsonKey(name: "disbursement_2026") num? disbursement2026,
    @JsonKey(name: "disbursement_2027") num? disbursement2027,
    @JsonKey(name: "disbursement_2028") num? disbursement2028,
  }) = _FinancialAccomplishment;

  factory FinancialAccomplishment.fromJson(Map<String, dynamic> json) =>
      _$FinancialAccomplishmentFromJson(json);

  // dump the entire variable
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@freezed
class FsCost with _$FsCost {
  factory FsCost({
    @JsonKey(name: "y2023") num? y2023,
    @JsonKey(name: "y2024") num? y2024,
    @JsonKey(name: "y2025") num? y2025,
    @JsonKey(name: "y2026") num? y2026,
    @JsonKey(name: "y2027") num? y2027,
    @JsonKey(name: "y2028") num? y2028,
  }) = _FsCost;

  factory FsCost.fromJson(Map<String, dynamic> json) => _$FsCostFromJson(json);
}

@freezed
class RowCost with _$RowCost {
  factory RowCost({
    @JsonKey(name: "y2023") num? y2023,
    @JsonKey(name: "y2024") num? y2024,
    @JsonKey(name: "y2025") num? y2025,
    @JsonKey(name: "y2026") num? y2026,
    @JsonKey(name: "y2027") num? y2027,
    @JsonKey(name: "y2028") num? y2028,
  }) = _RowCost;

  factory RowCost.fromJson(Map<String, dynamic> json) =>
      _$RowCostFromJson(json);
}

@freezed
class RapCost with _$RapCost {
  factory RapCost({
    @JsonKey(name: "y2023") num? y2023,
    @JsonKey(name: "y2024") num? y2024,
    @JsonKey(name: "y2025") num? y2025,
    @JsonKey(name: "y2026") num? y2026,
    @JsonKey(name: "y2027") num? y2027,
    @JsonKey(name: "y2028") num? y2028,
  }) = _RapCost;

  factory RapCost.fromJson(Map<String, dynamic> json) =>
      _$RapCostFromJson(json);
}
