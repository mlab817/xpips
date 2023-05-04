import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AccountRecoveryScreen extends StatefulWidget {
  const AccountRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<AccountRecoveryScreen> createState() => _AccountRecoveryScreenState();
}

class _AccountRecoveryScreenState extends State<AccountRecoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Recovery'),
      ),
      body: Column(children: const [
        Text(
            'Help us recover your account by verifying your email. Send a password verification email now.'),
      ]),
    );
  }
}
