import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/models/simple_project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/option.dart';

part 'simpleproject_controller.freezed.dart';
part 'simpleproject_controller.g.dart';

// SimpleProjectControllerState
@freezed
class SimpleProjectState with _$SimpleProjectState {
  bool get isValid {
    return project.title.isNotEmpty &&
        project.description.isNotEmpty &&
        project.type != null &&
        project.bases.isNotEmpty &&
        project.totalCost >= 0;
  }

  factory SimpleProjectState({
    required SimpleProject project,
  }) = _SimpleProjectState;

  SimpleProjectState._();
}

@Riverpod(keepAlive: true)
class SimpleProjectControllerState extends _$SimpleProjectControllerState {
  void update({
    String? title,
    Option? type,
    bool? regularProgram,
    List<Option>? bases,
    String? description,
    double? totalCost,
  }) {
    final updatedProject = state.project.copyWith(
      title: title ?? state.project.title,
      type: type ?? state.project.type,
      regularProgram: regularProgram ?? state.project.regularProgram,
      bases: bases ?? state.project.bases,
      description: description ?? state.project.description,
      totalCost: totalCost ?? state.project.totalCost,
    );
    state = state.copyWith(project: updatedProject);
  }

  @override
  SimpleProjectState build() =>
      SimpleProjectState(project: SimpleProject.initial());
}

@Riverpod(keepAlive: true)
SimpleProject simpleProject(SimpleProjectRef ref) {
  return ref.watch(simpleProjectControllerStateProvider).project;
}
