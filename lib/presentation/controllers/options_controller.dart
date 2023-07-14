import 'dart:async';

import 'package:pips/domain/entities/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/options_repository.dart';

part 'options_controller.g.dart';

@Riverpod(keepAlive: true)
Future<FormOptions> optionsController(OptionsControllerRef ref) async {
  final repository = ref.watch(optionsRepositoryProvider);

  return await repository.get();
}
