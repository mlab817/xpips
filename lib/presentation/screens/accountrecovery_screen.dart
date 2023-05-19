import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/controllers/auth_controller.dart';

class AccountRecoveryScreen extends ConsumerStatefulWidget {
  const AccountRecoveryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountRecoveryScreen> createState() =>
      _AccountRecoveryScreenState();
}

class _AccountRecoveryScreenState extends ConsumerState<AccountRecoveryScreen> {
  @override
  Widget build(BuildContext context) {
    final email = ref.watch(authControllerProvider)?.email;

    return Scaffold(
      body: Column(children: [
        ListTile(
          title: const Text(
              'Help us recover your account by verifying your email. Send a password verification email now.'),
          trailing: IconButton(
            onPressed: () {
              // send email verification
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('Send email verification to $email.'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Some other time')),
                    FilledButton(
                        onPressed: () {
                          // TODO: handle send
                        },
                        child: const Text('Resend')),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.mail),
          ),
        ),
      ]),
    );
  }
}
