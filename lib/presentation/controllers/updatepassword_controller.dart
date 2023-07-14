import 'dart:async';

import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:pips/data/requests/updatepassword_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../../data/responses/updatepassword_response.dart';

part 'updatepassword_controller.g.dart';

@riverpod
class UpdatePasswordController extends _$UpdatePasswordController {
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

abstract class UpdatePasswordRepository {
  Future<UpdatePasswordResponse> submit(UpdatePasswordRequest request);
}

class UpdatePasswordRepositoryImplementer implements UpdatePasswordRepository {
  final AppServiceClient client;

  UpdatePasswordRepositoryImplementer({required this.client});

  @override
  Future<UpdatePasswordResponse> submit(UpdatePasswordRequest request) async {
    return await client.updatePassword(request);
  }
}

final updatePasswordRepositoryProvider =
    Provider<UpdatePasswordRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return UpdatePasswordRepositoryImplementer(client: client);
});
