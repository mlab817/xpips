import 'package:xpips/domain/models/login_credentials.dart';
import 'package:xpips/domain/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginCredentials input);
}

class AuthRepositoryImplementer implements AuthRepository {
  @override
  Future<LoginResponse> login(LoginCredentials input) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
