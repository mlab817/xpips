import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../../application/app_router.dart';
import '../../../presentation/widgets/logout_button.dart';
import '../controllers/auth_controller.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final List<String> _menu = [
    'Update Profile',
    'Update Password',
    'Account Recovery',
    'Preferences',
    'About',
  ];

  final _screens = [
    const UpdateProfileRoute(),
    const UpdatePasswordRoute(),
    const AccountRecoveryRoute(),
    const PreferencesRoute(),
    const AboutRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // disable back button
        leading: null,
        title: const Text('Settings'),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _menu.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_menu[index]),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.router.push(_screens[index]);
                },
              );
            },
          ),
          if (Platform.isAndroid)
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Confirm'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text('Cancel'),
                            ),
                            FilledButton(
                              onPressed: () {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .logout();

                                AutoRouter.of(context)
                                    .replace(const LoginRoute());
                              },
                              child: const Text('Confirm'),
                            ),
                          ],
                        );
                      });
                },
                child: const Text('Logout'),
              ),
            ),
        ],
      ),
    );
  }
}
