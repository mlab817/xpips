import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../data/requests/updatepassword_request.dart';

@RoutePage()
class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UpdatePasswordRequest _updatePasswordRequest = UpdatePasswordRequest(
      currentPassword: '', password: '', passwordConfirmation: '');

  late TextEditingController currentPasswordController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentPasswordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _updatePasswordRequest = _updatePasswordRequest.copyWith(
              currentPassword: currentPasswordController.text);
        });
      });
    passwordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _updatePasswordRequest = _updatePasswordRequest.copyWith(
              password: passwordController.text);
        });
      });
    passwordConfirmationController = TextEditingController()
      ..addListener(() {
        setState(() {
          _updatePasswordRequest = _updatePasswordRequest.copyWith(
              passwordConfirmation: passwordConfirmationController.text);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();

    currentPasswordController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Current Password'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                }
                return null;
              },
              obscureText: true,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('New Password'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                }
                return null;
              },
              obscureText: true,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Confirm Password'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                }
                return null;
              },
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    // handle submit
                    if (_formKey.currentState!.validate()) {
                      // handle submit
                    }
                  },
                  child: const Text('Update Password')),
            ),
          ]),
        ),
      ),
    );
  }
}
