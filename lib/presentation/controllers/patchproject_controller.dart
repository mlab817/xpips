import 'package:pips/data/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/patchproject_response.dart';
import '../../domain/models/cost_schedule.dart';

part 'patchproject_controller.g.dart';

@Riverpod(keepAlive: true)
class PatchProjectController extends _$PatchProjectController {
  Future<PatchProjectResponse> submit(
      {required String uuid, required Map<String, dynamic> payload}) async {
    final repo = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.patch(uuid, payload));

    return await repo.patch(uuid, payload);
  }

  @override
  FutureOr<void> build() {}
}

@Riverpod(keepAlive: true)
class UpdateFinancialAccompController
    extends _$UpdateFinancialAccompController {
  Future<void> submit(
      {required String uuid, required Map<String, dynamic> payload}) async {
    final repo = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.updateFa(uuid, payload));
  }

  @override
  FutureOr<void> build() {}
}

@Riverpod(keepAlive: true)
class UpdateFs extends _$UpdateFs {
  Future<void> submit(
      {required String uuid, required CostSchedule payload}) async {
    final repo = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.updateFs(uuid, payload));
  }

  @override
  FutureOr<void> build() {}
}

@Riverpod(keepAlive: true)
class UpdateRow extends _$UpdateRow {
  Future<void> submit(
      {required String uuid, required CostSchedule payload}) async {
    final repo = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.updateRow(uuid, payload));
  }

  @override
  FutureOr<void> build() {}
}

@Riverpod(keepAlive: true)
class UpdateRap extends _$UpdateRap {
  Future<void> submit(
      {required String uuid, required CostSchedule payload}) async {
    final repo = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.updateRap(uuid, payload));
  }

  @override
  FutureOr<void> build() {}
}
