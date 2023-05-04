import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../application/app_router.dart';
import '../../presentation/widgets/logout_button.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> _menu = [
    'Update Profile',
    'Update Password',
    'Account Recovery',
    'About',
  ];

  final _screens = [
    const UpdateProfileRoute(),
    const UpdatePasswordRoute(),
    const AccountRecoveryRoute(),
    const AboutRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
    );
  }
}
