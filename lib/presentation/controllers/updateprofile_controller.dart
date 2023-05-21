import 'dart:async';

import 'package:pips/data/repositories/auth_repository.dart';
import 'package:pips/data/requests/updateprofile_request.dart';
import 'package:pips/presentation/controllers/user_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pips/application/extensions.dart';

import '../../data/responses/updateprofile_response.dart';

part 'updateprofile_controller.g.dart';

@Riverpod(keepAlive: true)
class UpdateProfileRequestController extends _$UpdateProfileRequestController {
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
}

@riverpod
class UpdateProfileController extends _$UpdateProfileController {
  Future<void> updateProfile() async {
    final repository = ref.read(authRepositoryProvider);
    final request = ref.read(updateProfileRequestControllerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.updateProfile(request));
  }

  @override
  FutureOr<UpdateProfileResponse> build() => Future.value(state.value);
}
