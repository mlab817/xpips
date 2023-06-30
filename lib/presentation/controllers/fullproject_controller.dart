import 'package:pips/data/responses/uploadattachment_response.dart';
import 'package:pips/presentation/controllers/controllers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/models.dart';

part 'fullproject_controller.g.dart';

@Riverpod(keepAlive: true)
class FullProjectController extends _$FullProjectController {
  void update({
    String? title,
    Option? type,
    List<Option>? bases,
    Office? office,
    List<Option>? operatingUnits,
    List<Option>? locations,
    bool? regularProgram,
    double? totalCost,
    Option? pdpChapter,
    Option? spatialCoverage,
    String? description,
    CostSchedule? fsCost,
    List<Option>? infrastructureSectors,
    bool? pip,
    List<FsInvestment>? fsInvestments,
    List<RegionalInvestment>? regionalInvestments,
    bool? iccable,
    bool? cip,
    bool? rdip,
    Option? approvalLevel,
    List<Option>? pdpChapters,
    List<Option>? sdgs,
    Option? cipType,
    bool? trip,
    bool? covid,
    DateTime? approvalLevelDate,
    String? expectedOutputs,
    String? remarks,
    bool? research,
    List<Option>? prerequisites,
    bool? hasRow,
    bool? hasRap,
    bool? hasRowRap,
    CostSchedule? rowCost,
    CostSchedule? rapCost,
    int? employedMale,
    int? employedFemale,
    Option? fundingSource,
    String? risk,
    Option? gad,
    List<Option>? agenda,
    Option? typology,
    Option? preparationDocument,
    bool? fsNeedsAssistance,
    Option? fsStatus,
    DateTime? fsCompletionDate,
    int? rowAffectedHouseholds,
    int? rapAffectedHouseholds,
    List<Option>? fundingSources,
    Option? implementationMode,
    List<Option>? fundingInstitutions,
    Option? category,
    Option? projectStatus,
    String? updates,
    Option? endYear,
    Option? startYear,
    DateTime? asOf,
    String? uacsCode,
    bool? pureGrant,
    FinancialAccomplishment? financialAccomplishment,
    String? notes,
    String? contactInformation,
    bool? iccResubmission,
    List<Option>? regions,
    List<Option>? provinces,
    Option? readinessLevel,
    String? pipolCode,
    String? pipolUrl,
    Option? pipolStatus,
  }) {
    state = state.copyWith(
      title: title ?? state.title,
      type: type ?? state.type,
      regularProgram: regularProgram ?? state.regularProgram,
      bases: bases ?? state.bases,
      office: office ?? state.office,
      operatingUnits: operatingUnits ?? state.operatingUnits,
      locations: locations ?? state.locations,
      totalCost: totalCost ?? state.totalCost,
      pdpChapter: pdpChapter ?? state.pdpChapter,
      spatialCoverage: spatialCoverage ?? state.spatialCoverage,
      description: description ?? state.description,
      fsCost: fsCost ?? state.fsCost,
      infrastructureSectors:
          infrastructureSectors ?? state.infrastructureSectors,
      pip: pip ?? state.pip,
      fsInvestments: fsInvestments ?? state.fsInvestments,
      regionalInvestments: regionalInvestments ?? state.regionalInvestments,
      iccable: iccable ?? state.iccable,
      cip: cip ?? state.cip,
      rdip: rdip ?? state.rdip,
      approvalLevel: approvalLevel ?? state.approvalLevel,
      pdpChapters: pdpChapters ?? state.pdpChapters,
      sdgs: sdgs ?? state.sdgs,
      cipType: cipType ?? state.cipType,
      trip: trip ?? state.trip,
      covid: covid ?? state.covid,
      approvalLevelDate: approvalLevelDate ?? state.approvalLevelDate,
      expectedOutputs: expectedOutputs ?? state.expectedOutputs,
      remarks: remarks ?? state.remarks,
      research: research ?? state.research,
      prerequisites: prerequisites ?? state.prerequisites,
      hasRow: hasRow ?? state.hasRow,
      rowCost: rowCost ?? state.rowCost,
      hasRap: hasRap ?? state.hasRap,
      rapCost: rapCost ?? state.rapCost,
      hasRowRap: hasRowRap ?? state.hasRowRap,
      employedMale: employedMale ?? state.employedMale,
      employedFemale: employedFemale ?? state.employedFemale,
      fundingSource: fundingSource ?? state.fundingSource,
      risk: risk ?? state.risk,
      gad: gad ?? state.gad,
      agenda: agenda ?? state.agenda,
      typology: typology ?? state.typology,
      preparationDocument: preparationDocument ?? state.preparationDocument,
      fsNeedsAssistance: fsNeedsAssistance ?? state.fsNeedsAssistance,
      fsStatus: fsStatus ?? state.fsStatus,
      fsCompletionDate: fsCompletionDate ?? state.fsCompletionDate,
      rowAffectedHouseholds:
          rowAffectedHouseholds ?? state.rowAffectedHouseholds,
      rapAffectedHouseholds:
          rapAffectedHouseholds ?? state.rapAffectedHouseholds,
      fundingSources: fundingSources ?? state.fundingSources,
      implementationMode: implementationMode ?? state.implementationMode,
      fundingInstitutions: fundingInstitutions ?? state.fundingInstitutions,
      category: category ?? state.category,
      projectStatus: projectStatus ?? state.projectStatus,
      updates: updates ?? state.updates,
      endYear: endYear ?? state.endYear,
      startYear: startYear ?? state.startYear,
      asOf: asOf ?? state.asOf,
      uacsCode: uacsCode ?? state.uacsCode,
      pureGrant: pureGrant ?? state.pureGrant,
      financialAccomplishment:
          financialAccomplishment ?? state.financialAccomplishment,
      notes: notes ?? state.notes,
      contactInformation: contactInformation ?? state.contactInformation,
      iccResubmission: iccResubmission ?? state.iccResubmission,
      regions: regions ?? state.regions,
      provinces: provinces ?? state.provinces,
      readinessLevel: readinessLevel ?? state.readinessLevel,
      pipolCode: pipolCode ?? state.pipolCode,
      pipolUrl: pipolUrl ?? state.pipolUrl,
      pipolStatus: pipolStatus ?? state.pipolStatus,
    );
  }

  void addRegionalInvestment({
    required RegionalInvestment regionalInvestment,
  }) {
    final currentRegionalInvestments = state.regionalInvestments.toList();

    currentRegionalInvestments.add(regionalInvestment);

    state = state.copyWith(regionalInvestments: currentRegionalInvestments);
  }

  void updateRegionalInvestment({
    required int currentIndex,
    required RegionalInvestment regionalInvestment,
  }) {
    final currentRegionalInvestments = state.regionalInvestments.toList();

    currentRegionalInvestments[currentIndex] = regionalInvestment;

    state = state.copyWith(regionalInvestments: currentRegionalInvestments);
  }

  void removeRegionalInvestment({
    required int index,
  }) {
    final currentRegionalInvestments = state.regionalInvestments.toList();

    // remove index
    currentRegionalInvestments.removeAt(index);

    state = state.copyWith(regionalInvestments: currentRegionalInvestments);
  }

  void addFsInvestment({
    required FsInvestment fsInvestment,
  }) {
    final currentFsInvestments = state.fsInvestments.toList();

    currentFsInvestments.add(fsInvestment);

    state = state.copyWith(fsInvestments: currentFsInvestments);
  }

  void updateFsInvestment(
      {required int index, required FsInvestment fsInvestment}) {
    final currentInvestments = state.fsInvestments.toList();

    int index = currentInvestments
        .indexWhere((element) => element.id == fsInvestment.id);

    // if found
    currentInvestments[index] = fsInvestment;

    state = state.copyWith(fsInvestments: currentInvestments);
  }

  void removeFsInvestment({
    required int index,
  }) {
    final currentInvestments = state.fsInvestments.toList();

    currentInvestments.removeAt(index);

    state = state.copyWith(fsInvestments: currentInvestments);
  }

  void addAttachment(UploadAttachmentResponseData data) {
    final curAttachments = state.attachments.toList();

    curAttachments.add(data);

    state = state.copyWith(attachments: curAttachments);
  }

  @override
  FullProject build(String uuid) {
    final asyncProject = ref.watch(futureProjectProvider(uuid: uuid));

    // assert(asyncProject.value?.project != null, 'Project cannot be null');

    return asyncProject.value!.project;
  }
}

@Riverpod(keepAlive: true)
bool fullProjectIsValid(FullProjectIsValidRef ref, {required String uuid}) {
  final project = ref.watch(fullProjectControllerProvider(uuid));

  final Map<String, String> errors = <String, String>{};

  if (project.title!.isEmpty) {
    errors['title'] = 'Title should not be empty';
  }

  if (project.type == null) {
    errors['type'] = 'Type is required';
  }

  if (project.bases.isEmpty) {
    errors['bases'] = 'Basis for implementation is required';
  }

  if (project.description!.isEmpty) {
    errors['description'] = 'Description is required';
  }

  if (project.totalCost == null) {
    errors['totalCost'] = 'Total cost is required';
  }

  if (project.office == null) {
    errors['office'] = 'Office is required';
  }

  if (project.operatingUnits.isEmpty) {
    errors['operatingUnits'] = 'Operating units are required';
  }

  if (project.spatialCoverage == null) {
    errors['spatialCoverage'] = 'Spatial coverage is required';
  }

  if (project.regions.isEmpty) {
    errors['regions'] = 'Regions are required';
  }

  if (project.provinces.isEmpty) {
    errors['provinces'] = 'Provinces are required';
  }

  return errors.isEmpty;
}
