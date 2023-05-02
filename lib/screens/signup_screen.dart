import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('First Name'),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Last Name'),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Position/Designation'),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Email Address'),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Contact Number'),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Office'),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Authorization Form'),
              ),
            ),
            // TODO: add fields
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                      onPressed: () {}, child: const Text('Sign up'))),
            ),
          ],
        ),
      ),
    );
  }
}
