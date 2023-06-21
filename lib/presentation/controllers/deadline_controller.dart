import 'package:pips/data/repositories/deadline_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/deadline_response.dart';

part 'deadline_controller.g.dart';

@Riverpod(keepAlive: true)
Future<DeadlineResponse> deadline(DeadlineRef ref) async {
  final repository = ref.watch(deadlineRepositoryProvider);

  return await repository.get();
}
