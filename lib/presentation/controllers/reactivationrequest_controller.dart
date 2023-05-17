import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/requests/reactivation_request.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/upload_repository.dart';
import '../../data/requests/upload_request.dart';
import '../../data/responses/upload_response.dart';

// Create controller to control [RequestReactivation]a
class ReactivationRequestController extends Notifier<ReactivationRequest> {
  void update({String? email, String? authorization}) {
    print('update method called with email: $email');
    print('update method called with authorization: $authorization');

    state = state.copyWith(
      email: email ?? state.email,
      authorization: authorization ?? state.authorization,
    );
  }

  @override
  ReactivationRequest build() =>
      ReactivationRequest(email: '', authorization: '');
}

final reactivationRequestControllerProvider =
    NotifierProvider<ReactivationRequestController, ReactivationRequest>(() {
  return ReactivationRequestController();
});

class ReactivationFileUploadController extends AsyncNotifier<UploadResponse?> {
  Future<UploadResponse?> upload(UploadRequest request) async {
    print('ReactivationFileUploadController executed');

    final repository = ref.watch(uploadRepositoryProvider);

    state = const AsyncLoading();

    final response = await repository.upload(request);

    print(response);

    state = await AsyncValue.guard(() => repository.upload(request));
  }

  @override
  FutureOr<UploadResponse?> build() async => null;
}

final reactivationFileUploadControllerProvider =
    AsyncNotifierProvider<ReactivationFileUploadController, UploadResponse?>(
        () {
  return ReactivationFileUploadController();
});

class RequestReactivationController extends AsyncNotifier<void> {
  Future<void> submit() async {
    final repository = ref.watch(authRepositoryProvider);
    final request = ref.watch(reactivationRequestControllerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(
        () async => repository.requestReactivation(request));
  }

  @override
  FutureOr<void> build() => null;
}

final requestReactivationController =
    AsyncNotifierProvider<RequestReactivationController, void>(() {
  return RequestReactivationController();
});
