import 'package:freezed_annotation/freezed_annotation.dart';

import 'option.dart';

part 'options.freezed.dart';
part 'options.g.dart';

@freezed
class Options with _$Options {
  factory Options({
    @JsonKey(name: "agenda") List<Option>? agenda,
    @JsonKey(name: "approval_levels") List<Option>? approvalLevels,
    @JsonKey(name: "bases") List<Option>? bases,
    @JsonKey(name: "categories") List<Option>? categories,
    @JsonKey(name: "cip_types") List<Option>? cipTypes,
    @JsonKey(name: "commodities") List<Option>? commodities,
    @JsonKey(name: "fs_statuses") List<Option>? fsStatuses,
    @JsonKey(name: "funding_institutions") List<Option>? fundingInstitutions,
    @JsonKey(name: "funding_sources") List<Option>? fundingSources,
    @JsonKey(name: "gads") List<Option>? gads,
    @JsonKey(name: "implementation_modes") List<Option>? implementationModes,
    @JsonKey(name: "infrastructure_sectors")
        List<Option>? infrastructureSectors,
    @JsonKey(name: "locations") List<Option>? locations,
    @JsonKey(name: "nafmip_outputs") List<Option>? nafmipOutputs,
    @JsonKey(name: "offices") List<Option>? offices,
    @JsonKey(name: "operating_units") List<Option>? operatingUnits,
    @JsonKey(name: "pdp_chapters") List<Option>? pdpChapters,
    @JsonKey(name: "pdp_strategies") List<Option>? pdpStrategies,
    @JsonKey(name: "pipol_statuses") List<Option>? pipolStatuses,
    @JsonKey(name: "pips_statuses") List<Option>? pipsStatuses,
    @JsonKey(name: "preparation_documents") List<Option>? preparationDocuments,
    @JsonKey(name: "prerequisites") List<Option>? prerequisites,
    @JsonKey(name: "prexcs") List<Option>? prexcs,
    @JsonKey(name: "programs") List<Option>? programs,
    @JsonKey(name: "project_statuses") List<Option>? projectStatuses,
    @JsonKey(name: "readiness_levels") List<Option>? readinessLevels,
    @JsonKey(name: "regions") List<Option>? regions,
    @JsonKey(name: "roles") List<Option>? roles,
    @JsonKey(name: "sdgs") List<Option>? sdgs,
    @JsonKey(name: "spatial_coverages") List<Option>? spatialCoverages,
    @JsonKey(name: "types") List<Option>? types,
    @JsonKey(name: "typologies") List<Option>? typologies,
    @JsonKey(name: "vc_segments") List<Option>? vcSegments,
    @JsonKey(name: "years") List<Option>? years,
    @JsonKey(name: "ou_types") List<Option>? ouTypes,
  }) = _Options;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
}
