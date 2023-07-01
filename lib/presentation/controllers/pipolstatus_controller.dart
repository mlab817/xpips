import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/pipolstatus_repository.dart';
import '../../data/responses/responses.dart';

part 'pipolstatus_controller.g.dart';

@Riverpod(keepAlive: true)
Future<PipolStatusResponse> pipolStatusController(
    PipolStatusControllerRef ref) async {
  return ref.watch(pipolStatusRepositoryProvider).getPipolStatuses();
}
