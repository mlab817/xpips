import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/auth_repository.dart';
import 'package:pips/domain/models/login_credentials.dart';
import 'package:pips/domain/models/login_response.dart';

///AsyncValue<void>, as this allows us to represent three states:
/// default (not loading) as AsyncData (same as AsyncValue.data)
/// loading as AsyncLoading (same as AsyncValue.loading)
/// error as AsyncError (same as AsyncValue.error)
/// And since StateNotifier needs an initial value, we must call super in the initializer list.
class LoginScreenController extends StateNotifier<AsyncValue<LoginResponse?>> {
  LoginScreenController({required this.authRepository})
      : super(const AsyncData(null));

  final AuthRepository authRepository;

  Future<void> login(LoginCredentials credentials) async {
    // set the state to loading
    state = const AsyncLoading<LoginResponse>();

    // call `authRepository.signInAnonymously` and await for the result
    state = await AsyncValue.guard<LoginResponse>(
        () => authRepository.login(credentials));
  }
}

final loginScreenControllerProvider = StateNotifierProvider.autoDispose<
    LoginScreenController, AsyncValue<LoginResponse?>>((ref) {
  return LoginScreenController(
      authRepository: ref.watch(authRepositoryProvider));
});
