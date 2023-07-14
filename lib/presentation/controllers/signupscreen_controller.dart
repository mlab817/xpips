// import 'dart:async';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pips/data/requests/signup_request.dart';
// import 'package:pips/data/responses/responses.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../data/repositories/repositories.dart';

// part 'signupscreen_controller.g.dart';

// @Riverpod(keepAlive: true)
// class SignupRequestController extends _$SignupRequestController {
//   void update({
//     String? username,
//     String? firstName,
//     String? lastName,
//     String? position,
//     String? email,
//     String? contactNumber,
//     int? officeId,
//     String? password,
//     String? authorization,
//   }) {
//     state = state.copyWith(
//       username: username ?? state.username,
//       firstName: firstName ?? state.firstName,
//       lastName: lastName ?? state.lastName,
//       position: position ?? state.position,
//       email: email ?? state.email,
//       contactNumber: contactNumber ?? state.contactNumber,
//       officeId: officeId ?? state.officeId,
//       password: password ?? state.password,
//       authorization: authorization ?? state.authorization,
//     );
//   }

//   // reset state to empty state
//   void reset() {
//     state = SignupRequest.initial();
//   }

//   @override
//   SignupRequest build() {
//     return SignupRequest.initial();
//   }
// }
