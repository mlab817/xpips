import 'package:pips/data/repositories/auth_repository.dart';
import 'package:pips/domain/models/login_credentials.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/responses.dart';

part 'login_controller.g.dart';

@Riverpod(keepAlive: true)
class LoginCredentialsController extends _$LoginCredentialsController {
  @override
  LoginCredentials build() => LoginCredentials.initial();

  void update({
    String? username,
    String? password,
  }) {
    state = state.copyWith(
      username: username ?? state.username,
      password: password ?? state.password,
    );
  }
}

@Riverpod(keepAlive: true)
class Login extends _$Login {
  @override
  FutureOr<LoginResponse?> build() => null;

  Future<LoginResponse?> login() async {
    final credentials = ref.read(loginCredentialsControllerProvider);
    final repository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.login(credentials));

    return null;
  }
}
