import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/requests/updateprofile_request.dart';
import '../domain/models/fullproject.dart';
import '../domain/models/preset.dart';
import '../domain/models/user.dart';

extension UserToProfileRequest on User {
  UpdateProfileRequest toUpdateProfileRequest() {
    return UpdateProfileRequest(
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      position: position ?? '',
      contactNumber: contactNumber ?? '',
    );
  }
}

extension AsyncValueUI on AsyncValue<void> {
  bool get isLoading => this is AsyncLoading<void>;

  void showSnackbarOnError(BuildContext context) =>
      whenOrNull(error: (error, _) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      });
}

extension ApplyPresets on FullProject {
  FullProject applyPresets(Preset preset) {
    return FullProject(
      bases: [],
      operatingUnits: [],
      pdpChapters: [],
      agenda: [],
      sdgs: [],
      fsCost: FsCost(),
      rowCost: RowCost(),
      rapCost: RapCost(),
      prerequisites: [],
      locations: [],
      infrastructureSectors: [],
      fundingInstitutions: [],
      fundingSources: [],
      fsInvestments: <FsInvestment>[],
      regionalInvestments: <RegionalInvestment>[],
      financialAccomplishment: FinancialAccomplishment(),
      typeId: preset.typeId,
      type: preset.type,
      regularProgram: preset.regularProgram ?? false,
      spatialCoverageId: preset.spatialCoverageId,
      spatialCoverage: preset.spatialCoverage,
      pip: preset.pip ?? false,
      typologyId: preset.typologyId,
      typology: preset.typology,
      cip: preset.cip ?? false,
      cipTypeId: preset.cipTypeId,
      cipType: preset.cipType,
      trip: preset.trip ?? false,
      rdcEndorsementRequired: preset.rdcEndorsementRequired ?? false,
      categoryId: preset.categoryId,
      category: preset.category,
      startYearId: preset.startYearId,
      startYear: preset.startYear,
      endYearId: preset.endYearId,
      endYear: preset.endYear,
      projectStatusId: preset.projectStatusId,
      projectStatus: preset.projectStatus,
      readinessLevelId: preset.readinessLevelId,
      readinessLevel: preset.readinessLevel,
      hasRow: preset.hasRow,
      hasRap: preset.hasRap,
      hasRowRap: preset.hasRowRap,
      fundingSourceId: preset.fundingSourceId,
      fundingSource: preset.fundingSource,
      pureGrant: preset.pureGrant,
      implementationModeId: preset.implementationModeId,
      implementationMode: preset.implementationMode,
    );
  }
}
