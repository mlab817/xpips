import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/responses/offices_response.dart';

import '../../data/repositories/offices_repository.dart';

class OfficesController extends AsyncNotifier<OfficesResponse> {
  Future<OfficesResponse> get() async {
    final repository = ref.watch(officesRepositoryProvider);

    state = const AsyncLoading();

    final response = repository.get();

    state = await AsyncValue.guard(() => response);

    return response;
  }

  @override
  FutureOr<OfficesResponse> build() {
    return get();
  }
}

final officesControllerProvider =
    AsyncNotifierProvider<OfficesController, OfficesResponse>(() {
  return OfficesController();
});

final officeFilterProvider = StateProvider<String?>((ref) => null);

final filteredOfficesControllerProvider =
    Provider<AsyncValue<OfficesResponse>>((ref) {
  final filter = ref.watch(officeFilterProvider);
  final valueAsync = ref.watch(officesControllerProvider);

  return filter != null
      ? valueAsync.when(
          data: (data) {
            return AsyncValue.data(OfficesResponse(
              data: data.data
                  .where((element) =>
                      element.acronym.toLowerCase().contains(filter) ||
                      element.name.toLowerCase().contains(filter))
                  .toList(),
            ));
          },
          error: (err, stack) => AsyncError(err, stack),
          loading: () => const AsyncLoading(),
        )
      : valueAsync;
});
