import 'package:freezed_annotation/freezed_annotation.dart';

import 'option.dart';

part 'form_options.g.dart';

@JsonSerializable()
class FormOptions {
  @JsonKey(name: "agenda")
  List<Option>? agenda;

  @JsonKey(name: "approval_levels")
  List<Option>? approvalLevels;

  @JsonKey(name: "bases")
  List<Option>? bases;

  @JsonKey(name: "categories")
  List<Option>? categories;

  @JsonKey(name: "cip_types")
  List<Option>? cipTypes;

  @JsonKey(name: "fs_statuses")
  List<Option>? fsStatuses;

  @JsonKey(name: "funding_institutions")
  List<Option>? fundingInstitutions;

  @JsonKey(name: "funding_sources")
  List<Option>? fundingSources;

  @JsonKey(name: "gads")
  List<Option>? gads;

  @JsonKey(name: "implementation_modes")
  List<Option>? implementationModes;

  @JsonKey(name: "infrastructure_sectors")
  List<Option>? infrastructureSectors;

  @JsonKey(name: "offices")
  List<Option>? offices;

  @JsonKey(name: "operating_units")
  List<Option>? operatingUnits;

  @JsonKey(name: "pdp_chapters")
  List<Option>? pdpChapters;

  // @JsonKey(name: "pdp_strategies") List<Option>? pdpStrategies,
  @JsonKey(name: "pipol_statuses")
  List<Option>? pipolStatuses;

  @JsonKey(name: "pips_statuses")
  List<Option>? pipsStatuses;

  @JsonKey(name: "preparation_documents")
  List<Option>? preparationDocuments;

  @JsonKey(name: "prerequisites")
  List<Option>? prerequisites;

  @JsonKey(name: "prexcs")
  List<Option>? prexcs;

  @JsonKey(name: "programs")
  List<Option>? programs;

  @JsonKey(name: "project_statuses")
  List<Option>? projectStatuses;

  @JsonKey(name: "provinces")
  List<Option>? provinces;

  @JsonKey(name: "readiness_levels")
  List<Option>? readinessLevels;

  @JsonKey(name: "regions")
  List<Option>? regions;

  @JsonKey(name: "roles")
  List<Option>? roles;

  @JsonKey(name: "sdgs")
  List<Option>? sdgs;

  @JsonKey(name: "spatial_coverages")
  List<Option>? spatialCoverages;

  @JsonKey(name: "types")
  List<Option>? types;

  @JsonKey(name: "typologies")
  List<Option>? typologies;

  @JsonKey(name: "years")
  List<Option>? years;

  @JsonKey(name: "ou_types")
  List<Option>? ouTypes;

  @JsonKey(name: "attachment_types")
  List<Option>? attachmentTypes;

  FormOptions({
    this.agenda,
    this.approvalLevels,
    this.bases,
    this.categories,
    this.cipTypes,
    this.fsStatuses,
    this.fundingInstitutions,
    this.fundingSources,
    this.gads,
    this.implementationModes,
    this.infrastructureSectors,
    this.offices,
    this.operatingUnits,
    this.pdpChapters,
    this.pipolStatuses,
    this.pipsStatuses,
    this.preparationDocuments,
    this.prerequisites,
    this.prexcs,
    this.programs,
    this.projectStatuses,
    this.provinces,
    this.readinessLevels,
    this.regions,
    this.roles,
    this.sdgs,
    this.spatialCoverages,
    this.types,
    this.typologies,
    this.years,
    this.ouTypes,
    this.attachmentTypes,
  });

  factory FormOptions.fromJson(Map<String, dynamic> json) =>
      _$FormOptionsFromJson(json);
}
