import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/options_repository.dart';
import '../../data/responses/options_response.dart';

class OptionsController extends AsyncNotifier<OptionsResponse> {
  Future<OptionsResponse> get() async {
    final repository = ref.watch(optionsRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.get());

    return repository.get();
  }

  @override
  FutureOr<OptionsResponse> build() {
    return get();
  }
}

final optionsControllerProvider =
    AsyncNotifierProvider<OptionsController, OptionsResponse>(() {
  return OptionsController();
});
