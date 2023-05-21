import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/financial_accomplishment.dart';
import '../../domain/models/fs_cost.dart';
import '../../domain/models/fs_investment.dart';
import '../../domain/models/fullproject.dart';
import '../../domain/models/office.dart';
import '../../domain/models/option.dart';
import '../../domain/models/rap_cost.dart';
import '../../domain/models/regional_investment.dart';
import '../../domain/models/row_cost.dart';
import 'options_controller.dart';

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
    FsCost? fsCost,
    List<Option>? infrastructureSectors,
    bool? pip,
    List<FsInvestment>? fsInvestments,
    List<RegionalInvestment>? regions,
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
    RowCost? rowCost,
    RapCost? rapCost,
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
      regions: regions ?? state.regions,
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
    );
  }

  @override
  FullProject build() {
    // initialize fsInvestments and regionalInvestments
    final options = ref.watch(optionsControllerProvider);
    List<FsInvestment> fsInvestments = [];
    List<RegionalInvestment> regions = [];

    options.when(
      data: (data) {
        for (var fs in data.data.fundingSources ?? []) {
          fsInvestments.add(FsInvestment.initial().copyWith(
            fundingSource: fs,
          ));
        }

        for (var region in data.data.regions ?? []) {
          regions.add(RegionalInvestment.initial().copyWith(region: region));
        }
      },
      error: (error, stacktrace) {},
      loading: () {},
    );

    // initialize the full project model
    return FullProject(
      bases: [],
      operatingUnits: [],
      pdpChapters: [],
      agenda: [],
      sdgs: [],
      fsCost: FsCost.initial(),
      rowCost: RowCost.initial(),
      rapCost: RapCost.initial(),
      prerequisites: [],
      locations: [],
      infrastructureSectors: [],
      fundingInstitutions: [],
      fundingSources: [],
      fsInvestments: fsInvestments,
      regions: regions,
      financialAccomplishment: FinancialAccomplishment.initial(),
    );
  }
}
