import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/domain/models/models.dart';

import '../data/requests/newproject_request.dart';
import '../data/requests/updateprofile_request.dart';
import '../data/responses/project_response.dart';

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

  void showSnackbarOnSuccess(BuildContext context) => whenOrNull(data: (data) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Success')));
      });
}

extension FsInvestmentTotal on FsInvestment {
  double _total() {
    return (y2022 ?? 0) +
        (y2023 ?? 0) +
        (y2024 ?? 0) +
        (y2025 ?? 0) +
        (y2026 ?? 0) +
        (y2027 ?? 0) +
        (y2028 ?? 0) +
        (y2029 ?? 0);
  }

  double get total => _total();
}

extension RegionalInvestmentTotal on RegionalInvestment {
  double _total() {
    return (y2022 ?? 0) +
        (y2023 ?? 0) +
        (y2024 ?? 0) +
        (y2025 ?? 0) +
        (y2026 ?? 0) +
        (y2027 ?? 0) +
        (y2028 ?? 0) +
        (y2029 ?? 0);
  }

  double get total => _total();
}

extension CalculateTotalEmployment on FullProject {
  // calculate total employment
  int? totalEmployment() {
    return (employedMale ?? 0) + (employedFemale ?? 0);
  }
}

extension FullProjectRegionalInvestmentTotal on FullProject {
  TotalRow _regionalInvestmentTotalRow() {
    if (regionalInvestments.isEmpty) {
      return TotalRow.initial();
    }

    return regionalInvestments.fold(TotalRow.initial(),
        (previousValue, element) {
      return TotalRow(
          y2022: previousValue.y2022 + (element.y2022 ?? 0),
          y2023: previousValue.y2023 + (element.y2023 ?? 0),
          y2024: previousValue.y2024 + (element.y2024 ?? 0),
          y2025: previousValue.y2025 + (element.y2025 ?? 0),
          y2026: previousValue.y2026 + (element.y2026 ?? 0),
          y2027: previousValue.y2027 + (element.y2027 ?? 0),
          y2028: previousValue.y2028 + (element.y2028 ?? 0),
          y2029: previousValue.y2029 + (element.y2029 ?? 0),
          grandTotal: previousValue.grandTotal + element.total);
    });
  }

  TotalRow get regionalInvestmentTotalRow => _regionalInvestmentTotalRow();
}

extension FullProjectFsInvestmentTotal on FullProject {
  TotalRow _fsInvestmentTotalRow() {
    if (fsInvestments.isEmpty) {
      return TotalRow.initial();
    }

    return fsInvestments.fold(TotalRow.initial(), (previousValue, element) {
      return TotalRow(
          y2022: previousValue.y2022 + (element.y2022 ?? 0),
          y2023: previousValue.y2023 + (element.y2023 ?? 0),
          y2024: previousValue.y2024 + (element.y2024 ?? 0),
          y2025: previousValue.y2025 + (element.y2025 ?? 0),
          y2026: previousValue.y2026 + (element.y2026 ?? 0),
          y2027: previousValue.y2027 + (element.y2027 ?? 0),
          y2028: previousValue.y2028 + (element.y2028 ?? 0),
          y2029: previousValue.y2029 + (element.y2029 ?? 0),
          grandTotal: previousValue.grandTotal + element.total);
    });
  }

  TotalRow get fsInvestmentTotalRow => _fsInvestmentTotalRow();
}

class TotalRow {
  final double y2022;
  final double y2023;
  final double y2024;
  final double y2025;
  final double y2026;
  final double y2027;
  final double y2028;
  final double y2029;
  final double grandTotal;

  TotalRow({
    required this.y2022,
    required this.y2023,
    required this.y2024,
    required this.y2025,
    required this.y2026,
    required this.y2027,
    required this.y2028,
    required this.y2029,
    required this.grandTotal,
  });

  static TotalRow initial() {
    return TotalRow(
      y2022: 0,
      y2023: 0,
      y2024: 0,
      y2025: 0,
      y2026: 0,
      y2027: 0,
      y2028: 0,
      y2029: 0,
      grandTotal: 0,
    );
  }
}

extension ToQuickResource on User {
  UserQuickResource toQuickResource() {
    return UserQuickResource(id: id, fullname: "$firstName $lastName");
  }
}

extension ToFullProject on ProjectResponse {
  FullProject toFullProject() => project;
}

// convert simple project to request form prior to submission
extension ToSimpleProjectRequest on SimpleProject {
  NewProjectRequest toRequest() {
    return NewProjectRequest(
      title: title,
      typeId: type!.value,
      regularProgram: regularProgram,
      bases: bases.map((e) => e.value).toList(),
      description: description,
      totalCost: totalCost,
    );
  }
}

extension ToOption on Office {
  Option toOption() {
    return Option(
      label: acronym,
      value: id,
    );
  }
}
