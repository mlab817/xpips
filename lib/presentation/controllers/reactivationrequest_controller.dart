import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:pips/data/requests/reactivation_request.dart';
import 'package:pips/data/responses/reactivation_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/upload_repository.dart';
import '../../data/responses/upload_response.dart';

part 'reactivationrequest_controller.g.dart';

// define a simple state provider for a class
@Riverpod(keepAlive: true)
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
  Future<void> upload(PlatformFile file) async {
    final repository = ref.watch(uploadRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.upload(file));
  }

  @override
  FutureOr<UploadResponse?> build() async => Future.value(state.value);
}

// define a future provider
@riverpod
Future<ReactivationResponse> requestReactivation(
    RequestReactivationRef ref) async {
  final payload = ref.watch(reactivationRequestControllerProvider);

  return ref.watch(authRepositoryProvider).requestReactivation(payload);
}

@Riverpod(keepAlive: true)
class RequestReactivationController extends _$RequestReactivationController {
  Future<ReactivationResponse> submit() async {
    final repo = ref.watch(authRepositoryProvider);
    final payload = ref.watch(reactivationRequestControllerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repo.requestReactivation(payload));

    return repo.requestReactivation(payload);
  }

  //
  @override
  FutureOr<ReactivationResponse> build() => Future.value(state.value);
}
