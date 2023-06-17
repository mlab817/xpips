import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/options_repository.dart';
import '../../data/responses/options_response.dart';

part 'options_controller.g.dart';

@Riverpod(keepAlive: true)
Future<OptionsResponse> optionsController(OptionsControllerRef ref) async {
  final repository = ref.watch(optionsRepositoryProvider);

  return await repository.get();
}
