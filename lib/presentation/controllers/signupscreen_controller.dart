import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/requests/signup_request.dart';

class SignupScreenController extends Notifier<SignupRequest> {
  void update({
    String? username,
    String? firstName,
    String? lastName,
    String? position,
    String? email,
    String? contactNumber,
    String? authorizationPath,
    int? officeId,
  }) {
    state = state.copyWith(
      username: username ?? state.username,
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      position: position ?? state.position,
      email: email ?? state.email,
      contactNumber: contactNumber ?? state.contactNumber,
      authorizationPath: authorizationPath ?? state.authorizationPath,
      officeId: officeId ?? state.officeId,
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
      authorizationPath: '',
      officeId: null,
    );
  }
}

final signupScreenControllerProvider =
    NotifierProvider<SignupScreenController, SignupRequest>(() {
  return SignupScreenController();
});
