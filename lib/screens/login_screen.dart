import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpips/domain/models/login_credentials.dart';
import 'package:xpips/presentation/controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  LoginCredentials _loginCredentials =
      LoginCredentials(username: '', password: '');

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _loginCredentials =
              _loginCredentials.copyWith(username: _usernameController.text);
        });
      });
    _passwordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _loginCredentials =
              _loginCredentials.copyWith(password: _passwordController.text);
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 100, height: 100, child: Placeholder()),
            const SizedBox(
              height: 30,
            ),
            const Text('Login to your PIPS Account'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _usernameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {
                // TODO: handle login
                final authController = ref.watch(authControllerProvider);

                authController.login(_loginCredentials);
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  // TODO: go to forgot password
                  Navigator.of(context).pushNamed('/forgot-password');
                },
                child: const Text('Forgot Password?')),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  // TODO: go to sign up
                  Navigator.of(context).pushNamed('/signup');
                },
                child: const Text('Sign up')),
          ],
        ),
      ),
    );
  }
}
