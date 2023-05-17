import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/extensions.dart';
import 'package:pips/data/repositories/auth_repository.dart';
import 'package:pips/data/requests/updateprofile_request.dart';
import 'package:pips/presentation/controllers/user_controller.dart';

class UpdateProfileRequestController extends Notifier<UpdateProfileRequest> {
  void update({
    String? firstName,
    String? lastName,
    String? position,
    String? contactNumber,
  }) {
    state = state.copyWith(
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      position: position ?? state.position,
      contactNumber: contactNumber ?? state.contactNumber,
    );
  }

  @override
  UpdateProfileRequest build() {
    final currentUser = ref.watch(currentUserControllerProvider);

    return currentUser?.toUpdateProfileRequest() ??
        UpdateProfileRequest(
          firstName: '',
          lastName: '',
          position: '',
          contactNumber: '',
        );
  }
}

final updateProfileRequestControllerProvider =
    NotifierProvider<UpdateProfileRequestController, UpdateProfileRequest>(() {
  return UpdateProfileRequestController();
});

class UpdateProfileController extends AsyncNotifier<void> {
  Future<void> submit() async {
    final request = ref.watch(updateProfileRequestControllerProvider);
    final repository = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.updateProfile(request));

    // TODO: trigger current user update
  }

  @override
  FutureOr<void> build() => null;
}

final updateProfileControllerProvider =
    AsyncNotifierProvider<UpdateProfileController, void>(() {
  return UpdateProfileController();
});
