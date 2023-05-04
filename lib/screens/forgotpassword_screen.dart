import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(),
            FilledButton(
              onPressed: () {
                // TODO: send forgot password reset email
              },
              child: const Text('Send Password Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}
