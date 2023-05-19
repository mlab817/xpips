import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:pips/data/requests/updatepassword_request.dart';

class UpdatePasswordController extends Notifier<UpdatePasswordRequest> {
  void update({
    String? currentPassword,
    String? password,
    String? passwordConfirmation,
  }) {
    state = state.copyWith(
      currentPassword: currentPassword ?? state.currentPassword,
      password: password ?? state.password,
      passwordConfirmation: passwordConfirmation ?? state.passwordConfirmation,
    );
  }

  @override
  UpdatePasswordRequest build() {
    return UpdatePasswordRequest(
        currentPassword: '', password: '', passwordConfirmation: '');
  }
}

final updatePasswordRequestControllerProvider =
    NotifierProvider<UpdatePasswordController, UpdatePasswordRequest>(() {
  return UpdatePasswordController();
});

class UpdatePasswordSubmitController extends AsyncNotifier<void> {
  Future<void> submit() async {
    final repository = ref.watch(updatePasswordRepositoryProvider);
    final request = ref.watch(updatePasswordRequestControllerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.submit(request));
  }

  @override
  FutureOr<void> build() {
    // nothing to do
  }
}

abstract class UpdatePasswordRepository {
  Future<void> submit(UpdatePasswordRequest request);
}

class UpdatePasswordRepositoryImplementer implements UpdatePasswordRepository {
  final AppServiceClient client;

  UpdatePasswordRepositoryImplementer({required this.client});

  @override
  Future<void> submit(UpdatePasswordRequest request) async {
    return client.updatePassword(request);
  }
}

final updatePasswordRepositoryProvider =
    Provider<UpdatePasswordRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return UpdatePasswordRepositoryImplementer(client: client);
});

final updatePasswordSubmitControllerProvider =
    AsyncNotifierProvider<UpdatePasswordSubmitController, void>(() {
  return UpdatePasswordSubmitController();
});
