import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/options_repository.dart';
import '../../data/responses/options_response.dart';

part 'options_controller.g.dart';

@riverpod
class OptionsController extends _$OptionsController {
  Future<void> get() async {
    final repository = ref.watch(optionsRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.get());
  }

  @override
  FutureOr<OptionsResponse> build() => Future.value(state.value);
}
