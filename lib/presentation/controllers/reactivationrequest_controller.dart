import 'dart:async';
import 'dart:io';

import 'package:pips/data/requests/reactivation_request.dart';
import 'package:pips/data/responses/reactivation_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/upload_repository.dart';
import '../../data/responses/upload_response.dart';

part 'reactivationrequest_controller.g.dart';

// define a simple state provider for a class
@riverpod
class ReactivationRequestController extends _$ReactivationRequestController {
  @override
  ReactivationRequest build() {
    return ReactivationRequest(email: '', authorization: '');
  }

  void update({
    String? email,
    String? authorization,
  }) {
    state = state.copyWith(
        email: email ?? state.email,
        authorization: authorization ?? state.authorization);
  }
}

@riverpod
class ReactivationFileUploadController
    extends _$ReactivationFileUploadController {
  Future<void> upload(File file) async {
    final repository = ref.watch(uploadRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.upload(file));
  }

  @override
  FutureOr<UploadResponse> build() async => Future.value(state.value);
}

// define a future provider
@riverpod
Future<ReactivationResponse> requestReactivation(RequestReactivationRef ref) {
  return ref
      .watch(authRepositoryProvider)
      .requestReactivation(ref.watch(reactivationRequestControllerProvider));
}
