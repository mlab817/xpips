import 'package:pips/data/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patchproject_controller.g.dart';

@Riverpod(keepAlive: true)
class PatchProjectController extends _$PatchProjectController {
  Future<void> submit(
      {required String uuid, required Map<String, dynamic> payload}) async {
    final repo = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.patch(uuid, payload));
  }

  @override
  FutureOr<void> build() {}
}

@Riverpod(keepAlive: true)
class UpdateFinancialAccompController
    extends _$UpdateFinancialAccompController {
  Future<void> submit(
      {required int id, required Map<String, dynamic> payload}) async {
    final repo = ref.watch(projectRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.updateFa(id, payload));
  }

  @override
  FutureOr<void> build() {}
}
