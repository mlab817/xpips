import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/responses/responses.dart';

import '../../data/repositories/repositories.dart';

final deleteProjectControllerProvider = FutureProvider.family<
    DeleteProjectResponse,
    String>((ref, uuid) {
  //
  final repository = ref.watch(projectRepositoryProvider);

  return repository.delete(uuid);
});