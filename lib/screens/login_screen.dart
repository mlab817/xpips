import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 0,
      ),
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
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {
                // TODO: handle login
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
