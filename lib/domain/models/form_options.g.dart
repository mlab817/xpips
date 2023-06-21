// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormOptionsAdapter extends TypeAdapter<FormOptions> {
  @override
  final int typeId = 0;

  @override
  FormOptions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FormOptions(
      agenda: (fields[0] as List?)?.cast<Option>(),
      approvalLevels: (fields[1] as List?)?.cast<Option>(),
      bases: (fields[2] as List?)?.cast<Option>(),
      categories: (fields[3] as List?)?.cast<Option>(),
      cipTypes: (fields[4] as List?)?.cast<Option>(),
      fsStatuses: (fields[5] as List?)?.cast<Option>(),
      fundingInstitutions: (fields[6] as List?)?.cast<Option>(),
      fundingSources: (fields[7] as List?)?.cast<Option>(),
      gads: (fields[8] as List?)?.cast<Option>(),
      implementationModes: (fields[9] as List?)?.cast<Option>(),
      infrastructureSectors: (fields[10] as List?)?.cast<Option>(),
      offices: (fields[11] as List?)?.cast<Option>(),
      operatingUnits: (fields[12] as List?)?.cast<Option>(),
      pdpChapters: (fields[13] as List?)?.cast<Option>(),
      pipolStatuses: (fields[14] as List?)?.cast<Option>(),
      pipsStatuses: (fields[15] as List?)?.cast<Option>(),
      preparationDocuments: (fields[16] as List?)?.cast<Option>(),
      prerequisites: (fields[17] as List?)?.cast<Option>(),
      prexcs: (fields[18] as List?)?.cast<Option>(),
      programs: (fields[19] as List?)?.cast<Option>(),
      projectStatuses: (fields[20] as List?)?.cast<Option>(),
      provinces: (fields[21] as List?)?.cast<Option>(),
      readinessLevels: (fields[22] as List?)?.cast<Option>(),
      regions: (fields[23] as List?)?.cast<Option>(),
      roles: (fields[24] as List?)?.cast<Option>(),
      sdgs: (fields[25] as List?)?.cast<Option>(),
      spatialCoverages: (fields[26] as List?)?.cast<Option>(),
      types: (fields[27] as List?)?.cast<Option>(),
      typologies: (fields[28] as List?)?.cast<Option>(),
      years: (fields[29] as List?)?.cast<Option>(),
      ouTypes: (fields[30] as List?)?.cast<Option>(),
      attachmentTypes: (fields[31] as List?)?.cast<Option>(),
    );
  }

  @override
  void write(BinaryWriter writer, FormOptions obj) {
    writer
      ..writeByte(32)
      ..writeByte(0)
      ..write(obj.agenda)
      ..writeByte(1)
      ..write(obj.approvalLevels)
      ..writeByte(2)
      ..write(obj.bases)
      ..writeByte(3)
      ..write(obj.categories)
      ..writeByte(4)
      ..write(obj.cipTypes)
      ..writeByte(5)
      ..write(obj.fsStatuses)
      ..writeByte(6)
      ..write(obj.fundingInstitutions)
      ..writeByte(7)
      ..write(obj.fundingSources)
      ..writeByte(8)
      ..write(obj.gads)
      ..writeByte(9)
      ..write(obj.implementationModes)
      ..writeByte(10)
      ..write(obj.infrastructureSectors)
      ..writeByte(11)
      ..write(obj.offices)
      ..writeByte(12)
      ..write(obj.operatingUnits)
      ..writeByte(13)
      ..write(obj.pdpChapters)
      ..writeByte(14)
      ..write(obj.pipolStatuses)
      ..writeByte(15)
      ..write(obj.pipsStatuses)
      ..writeByte(16)
      ..write(obj.preparationDocuments)
      ..writeByte(17)
      ..write(obj.prerequisites)
      ..writeByte(18)
      ..write(obj.prexcs)
      ..writeByte(19)
      ..write(obj.programs)
      ..writeByte(20)
      ..write(obj.projectStatuses)
      ..writeByte(21)
      ..write(obj.provinces)
      ..writeByte(22)
      ..write(obj.readinessLevels)
      ..writeByte(23)
      ..write(obj.regions)
      ..writeByte(24)
      ..write(obj.roles)
      ..writeByte(25)
      ..write(obj.sdgs)
      ..writeByte(26)
      ..write(obj.spatialCoverages)
      ..writeByte(27)
      ..write(obj.types)
      ..writeByte(28)
      ..write(obj.typologies)
      ..writeByte(29)
      ..write(obj.years)
      ..writeByte(30)
      ..write(obj.ouTypes)
      ..writeByte(31)
      ..write(obj.attachmentTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormOptionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
