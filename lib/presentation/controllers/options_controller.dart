import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/options_repository.dart';
import '../../data/responses/options_response.dart';

part 'options_controller.g.dart';

@Riverpod(keepAlive: true)
class OptionsController extends _$OptionsController {
  Future<OptionsResponse> get() async {
    final repository = ref.watch(optionsRepositoryProvider);

    state = const AsyncLoading();

    final response = repository.get();

    state = await AsyncValue.guard(() => response);

    return await response;
  }

  @override
  FutureOr<OptionsResponse> build() => get();
}
