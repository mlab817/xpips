// minimal definition of a project
import 'package:freezed_annotation/freezed_annotation.dart';

import 'option.dart';

part 'simple_project.freezed.dart';
part 'simple_project.g.dart';

@freezed
class SimpleProject with _$SimpleProject {
  factory SimpleProject({
    required String title,
    Option? type,
    @JsonKey(name: "regular_program") required bool regularProgram,
    required List<Option> bases,
    required String description,
    @JsonKey(name: "total_cost") required double totalCost,
  }) = _SimpleProject;

  factory SimpleProject.fromJson(Map<String, dynamic> json) =>
      _$SimpleProjectFromJson(json);

  static SimpleProject initial() {
    return SimpleProject(
      title: '',
      regularProgram: false,
      type: null,
      bases: [],
      description: '',
      totalCost: 0,
    );
  }
}
