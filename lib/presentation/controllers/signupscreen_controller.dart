import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:pips/data/requests/signup_request.dart';
import 'package:pips/data/responses/responses.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/repositories.dart';

part 'signupscreen_controller.g.dart';

@Riverpod(keepAlive: true)
class SignupRequestController extends _$SignupRequestController {
  void update({
    String? username,
    String? firstName,
    String? lastName,
    String? position,
    String? email,
    String? contactNumber,
    int? officeId,
    String? password,
  }) {
    final authorization =
        ref.read(authorizationFileUploadControllerProvider).value;
    state = state.copyWith(
      username: username ?? state.username,
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      position: position ?? state.position,
      email: email ?? state.email,
      contactNumber: contactNumber ?? state.contactNumber,
      officeId: officeId ?? state.officeId,
      authorization: authorization?.path,
      password: password ?? state.password,
    );
  }

  @override
  SignupRequest build() {
    return SignupRequest.initial();
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

@Riverpod(keepAlive: true)
class AuthorizationFileUploadController
    extends _$AuthorizationFileUploadController {
  Future<UploadResponse?> upload(File file) async {
    print('AuthorizationFileUploadController triggered');

    final repository = ref.watch(uploadRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.upload(file));

    return repository.upload(file);
  }

  Future<UploadResponse?> webUpload(Uint8List file) async {
    print('AuthorizationFileUploadController triggered');

    final repository = ref.watch(uploadRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.webUpload(file));

    return repository.webUpload(file);
  }

  @override
  FutureOr<UploadResponse?> build() => Future.value(null);
}
