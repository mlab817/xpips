import 'dart:async';

import 'package:pips/data/responses/offices_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/offices_repository.dart';

part 'offices_controller.g.dart';

@Riverpod(keepAlive: true)
Future<OfficesResponse> offices(OfficesRef ref) {
  return ref.watch(officesRepositoryProvider).get();
}

final officeFilterProvider = Provider<String?>((ref) => '');

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
