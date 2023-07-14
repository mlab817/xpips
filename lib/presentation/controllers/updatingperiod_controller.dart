import 'package:pips/data/repositories/updatingperiod_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/updatingperiod_response.dart';

part 'updatingperiod_controller.g.dart';

@Riverpod(keepAlive: true)
Future<UpdatingPeriodResponse> updatingPeriod(UpdatingPeriodRef ref) async {
  final repository = ref.watch(updatingPeriodRepositoryProvider);

  final response = await repository.get();

  return response;
}

@Riverpod(keepAlive: true)
UpdatingPeriodResponse? updatingPeriodValue(UpdatingPeriodValueRef ref) {
  return ref.watch(updatingPeriodProvider).value;
}
