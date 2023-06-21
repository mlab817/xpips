import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'option.dart';

part 'form_options.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class FormOptions {
  @HiveField(0)
  @JsonKey(name: "agenda")
  List<Option>? agenda;

  @HiveField(1)
  @JsonKey(name: "approval_levels")
  List<Option>? approvalLevels;

  @HiveField(2)
  @JsonKey(name: "bases")
  List<Option>? bases;

  @HiveField(3)
  @JsonKey(name: "categories")
  List<Option>? categories;

  @HiveField(4)
  @JsonKey(name: "cip_types")
  List<Option>? cipTypes;

  @HiveField(5)
  @JsonKey(name: "fs_statuses")
  List<Option>? fsStatuses;

  @HiveField(6)
  @JsonKey(name: "funding_institutions")
  List<Option>? fundingInstitutions;

  @HiveField(7)
  @JsonKey(name: "funding_sources")
  List<Option>? fundingSources;

  @HiveField(8)
  @JsonKey(name: "gads")
  List<Option>? gads;

  @HiveField(9)
  @JsonKey(name: "implementation_modes")
  List<Option>? implementationModes;

  @HiveField(10)
  @JsonKey(name: "infrastructure_sectors")
  List<Option>? infrastructureSectors;

  @HiveField(11)
  @JsonKey(name: "offices")
  List<Option>? offices;

  @HiveField(12)
  @JsonKey(name: "operating_units")
  List<Option>? operatingUnits;

  @HiveField(13)
  @JsonKey(name: "pdp_chapters")
  List<Option>? pdpChapters;

  @HiveField(14)
  // @JsonKey(name: "pdp_strategies") List<Option>? pdpStrategies,
  @JsonKey(name: "pipol_statuses")
  List<Option>? pipolStatuses;

  @HiveField(15)
  @JsonKey(name: "pips_statuses")
  List<Option>? pipsStatuses;

  @HiveField(16)
  @JsonKey(name: "preparation_documents")
  List<Option>? preparationDocuments;

  @HiveField(17)
  @JsonKey(name: "prerequisites")
  List<Option>? prerequisites;

  @HiveField(18)
  @JsonKey(name: "prexcs")
  List<Option>? prexcs;

  @HiveField(19)
  @JsonKey(name: "programs")
  List<Option>? programs;

  @HiveField(20)
  @JsonKey(name: "project_statuses")
  List<Option>? projectStatuses;

  @HiveField(21)
  @JsonKey(name: "provinces")
  List<Option>? provinces;

  @HiveField(22)
  @JsonKey(name: "readiness_levels")
  List<Option>? readinessLevels;

  @HiveField(23)
  @JsonKey(name: "regions")
  List<Option>? regions;

  @HiveField(24)
  @JsonKey(name: "roles")
  List<Option>? roles;

  @HiveField(25)
  @JsonKey(name: "sdgs")
  List<Option>? sdgs;

  @HiveField(26)
  @JsonKey(name: "spatial_coverages")
  List<Option>? spatialCoverages;

  @HiveField(27)
  @JsonKey(name: "types")
  List<Option>? types;

  @HiveField(28)
  @JsonKey(name: "typologies")
  List<Option>? typologies;

  @HiveField(29)
  @JsonKey(name: "years")
  List<Option>? years;

  @HiveField(30)
  @JsonKey(name: "ou_types")
  List<Option>? ouTypes;

  @HiveField(31)
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
