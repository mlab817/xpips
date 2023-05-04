import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/app_router.dart';
import '../controllers/auth_controller.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  Future<void> _handleLogout(context, ref) async {
    final confirmed = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        });

    if (confirmed) {
      final authController = ref.watch(authControllerProvider);

      authController.logout();

      AutoRouter.of(context).replace(const LoginRoute());
    } else {
      print('Cancelled');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return IconButton(
      onPressed: () {
        // TODO: handle logout
        _handleLogout(context, ref);
      },
      icon: const Icon(Icons.exit_to_app),
    );
  }
}
