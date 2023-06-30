import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../../../presentation/screens/preferences_screen.dart';
import '../../../../presentation/screens/updatepassword_screen.dart';
import '../../../../presentation/screens/updateprofile_screen.dart';
import '../../../../application/app_router.dart';
import '../../controllers/auth_controller.dart';
import '../about_screen.dart';
import '../accountrecovery_screen.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  final List<String> _menu = [
    'Update Profile',
    'Update Password',
    'Account Recovery',
    'Preferences',
    'About',
  ];

  final _screens = [
    const UpdateProfileScreen(),
    const UpdatePasswordScreen(),
    const AccountRecoveryScreen(),
    const PreferencesScreen(),
    const AboutScreen(),
  ];

  final _titles = [
    'Update Profile',
    'Update Password',
    'Account Recovery',
    'Preferences',
    'About',
  ];

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Platform.isAndroid
          ? Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _menu.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        title: Text(_menu[index]),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });

                          Navigator.of(context).pop();
                        },
                        selected: index == _currentIndex,
                        selectedTileColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirm'),
                                  content: const Text(
                                      'Are you sure you want to logout?'),
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
                                            .read(
                                                authControllerProvider.notifier)
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
                  ),
                ],
              ),
            )
          : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Platform.isAndroid)
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _menu.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        title: Text(_menu[index]),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        selected: index == _currentIndex,
                        selectedTileColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirm'),
                                  content: const Text(
                                      'Are you sure you want to logout?'),
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
                                            .read(
                                                authControllerProvider.notifier)
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
                  ),
                ],
              ),
            ),
          Expanded(
            child: Column(
              children: [
                AppBar(
                  title: Text(_titles[_currentIndex]),
                  automaticallyImplyLeading: false,
                ),
                Expanded(
                  child: _screens[_currentIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
