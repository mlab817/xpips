import 'dart:async';

import 'package:pips/data/repositories/auth_repository.dart';
import 'package:pips/data/requests/signup_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signupscreen_controller.g.dart';

@riverpod
class SignupRequestController extends _$SignupRequestController {
  void update(
      {String? username,
      String? firstName,
      String? lastName,
      String? position,
      String? email,
      String? contactNumber,
      int? officeId,
      String? authorization}) {
    state = state.copyWith(
      username: username ?? state.username,
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      position: position ?? state.position,
      email: email ?? state.email,
      contactNumber: contactNumber ?? state.contactNumber,
      officeId: officeId ?? state.officeId,
      authorization: authorization ?? state.authorization,
    );
  }

  @override
  SignupRequest build() {
    return SignupRequest(
      username: '',
      firstName: '',
      lastName: '',
      position: '',
      email: '',
      contactNumber: '',
      officeId: null,
    );
  }
}

@riverpod
class SignupController extends _$SignupController {
  Future<void> submit() async {
    final repository = ref.watch(authRepositoryProvider);
    final request = ref.watch(signupRequestControllerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async => repository.signup(request));
  }

  @override
  FutureOr<void> build() => null;
}
