import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/controllers/updatepassword_controller.dart';

class UpdatePasswordScreen extends ConsumerStatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdatePasswordScreen> createState() =>
      _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends ConsumerState<UpdatePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController currentPasswordController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  bool _passwordIsObscured = true;

  void _togglePasswordObscurity(bool? value) {
    setState(() {
      _passwordIsObscured = value ?? false;
    });
  }

  @override
  void initState() {
    super.initState();

    currentPasswordController = TextEditingController()
      ..addListener(() {
        ref
            .read(updatePasswordRequestControllerProvider.notifier)
            .update(currentPassword: currentPasswordController.text);
      });
    passwordController = TextEditingController()
      ..addListener(() {
        ref
            .read(updatePasswordRequestControllerProvider.notifier)
            .update(password: passwordController.text);
      });
    passwordConfirmationController = TextEditingController()
      ..addListener(() {
        ref
            .read(updatePasswordRequestControllerProvider.notifier)
            .update(passwordConfirmation: passwordConfirmationController.text);
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
    final submitAsync = ref.watch(updatePasswordSubmitControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Current Password'),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                  obscureText: _passwordIsObscured,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('New Password'),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                  obscureText: _passwordIsObscured,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Confirm Password'),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                  obscureText: _passwordIsObscured,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _togglePasswordObscurity(!_passwordIsObscured);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: !_passwordIsObscured,
                        onChanged: null,
                      ),
                      const Text('Show Password')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () {
                    // handle submit
                    if (_formKey.currentState!.validate()) {
                      // handle submit
                      ref
                          .read(updatePasswordSubmitControllerProvider.notifier)
                          .submit();
                    }
                  },
                  child: submitAsync.when(
                      data: (data) {
                        return const Text('Update Password');
                      },
                      error: (error, _) => Text(error.toString()),
                      loading: () {
                        return const CircularProgressIndicator();
                      }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
