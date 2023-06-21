import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/requests/login_request.dart';
import '../../data/responses/responses.dart';

part 'login_controller.g.dart';

@Riverpod(keepAlive: true)
class LoginRequestController extends _$LoginRequestController {
  @override
  LoginRequest build() => LoginRequest.initial();

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
    final credentials = ref.read(loginRequestControllerProvider);
    final repository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.login(credentials));

    return null;
  }
}
