import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/responses/offices_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/offices_repository.dart';
import '../../domain/entities/models.dart';

part 'offices_controller.g.dart';

@Riverpod(keepAlive: true)
Future<OfficesResponse> offices(OfficesRef ref) {
  return ref.watch(officesRepositoryProvider).get();
}

final officeFilterProvider = StateProvider<String>((ref) => '');

final filteredOfficesProvider = Provider<List<Office>>((ref) {
  final offices = ref.watch(officesProvider).value;
  final filterValue = ref.watch(officeFilterProvider).toLowerCase();

  if (filterValue.isNotEmpty) {
    return offices?.data.where((office) =>
        office.name.toLowerCase().contains(filterValue.toLowerCase()) ||
        office.acronym.toLowerCase().contains(filterValue.toLowerCase())).toList() ?? <Office>[];
  }

  return offices?.data ?? <Office>[];
});

// final filteredOfficesControllerProvider =
//     Provider<AsyncValue<OfficesResponse>>((ref) {
//   final filter = ref.watch(officeFilterProvider);
//   final valueAsync = ref.watch(officesControllerProvider);

//   return filter != null
//       ? valueAsync.when(
//           data: (data) {
//             return AsyncValue.data(OfficesResponse(
//               data: data.data
//                   .where((element) =>
//                       element.acronym.toLowerCase().contains(filter) ||
//                       element.name.toLowerCase().contains(filter))
//                   .toList(),
//             ));
//           },
//           error: (err, stack) => AsyncError(err, stack),
//           loading: () => const AsyncLoading(),
//         )
//       : valueAsync;
// });
