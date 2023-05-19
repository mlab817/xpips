import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pips/data/repositories/auth_repository.dart';
import 'package:pips/domain/models/login_credentials.dart';
import 'package:pips/domain/models/login_response.dart';

part 'loginscreen_controller.g.dart';

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

@riverpod
class LoginController extends _$LoginController {
  Future<void> login() async {
    final credentials = ref.watch(loginCredentialsControllerProvider);
    final repository = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.login(credentials));
  }

  @override
  FutureOr<LoginResponse> build() => Future.value(state.value);
}
