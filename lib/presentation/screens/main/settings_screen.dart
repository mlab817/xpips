import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../../../application/app_router.dart';
import '../../controllers/auth_controller.dart';
import 'settings/about_screen.dart';
import 'settings/accountrecovery_screen.dart';
import 'settings/preferences_screen.dart';
import 'settings/updatepassword_screen.dart';
import 'settings/updateprofile_screen.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final PageController _pageController = PageController();

  int? _currentIndex;

  final List<Menu> _menuItems = [
    Menu(title: 'Update Profile', screen: const UpdateProfileScreen()),
    Menu(title: 'Update Password', screen: const UpdatePasswordScreen()),
    Menu(title: 'Account Recovery', screen: const AccountRecoveryScreen()),
    Menu(title: 'Preferences', screen: const PreferencesScreen()),
    Menu(title: 'About', screen: const AboutScreen()),
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

  void _confirmLogout() {
    showDialog(
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
                  ref.read(authControllerProvider.notifier).logout();

                  AutoRouter.of(context).replace(const LoginRoute());
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();

    if (!Platform.isAndroid) {
      _currentIndex = 0;
    }
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('SETTINGS'),
        ),
        body: Column(
          children: _buildMenu(),
        ),
      );
    }

    return Scaffold(
      drawer: _buildDrawer(),
      body: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!Platform.isAndroid) _buildSideMenu(), // content
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget? _buildDrawer() {
    return Platform.isAndroid
        ? Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: _buildMenu(),
            ),
          )
        : null;
  }

  Widget _buildSideMenu() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 250,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: _buildMenu(),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: _confirmLogout,
          child: const Text('LOGOUT'),
        ),
      ),
    );
  }

  List<Widget> _buildMenu() {
    return [
      ListView.builder(
        shrinkWrap: true,
        itemCount: _menuItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            title: Text(_menuItems[index].title),
            onTap: () {
              // depending on the size of the screen, either toggle through screens
              // or navigate to route
              if (Platform.isAndroid) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => _menuItems[index].screen));
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            selected: index == _currentIndex,
            selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          );
        },
      ),
      _buildLogoutButton()
    ];
  }

  Widget _buildContent() {
    // _currentIndex is null, return an empty container
    if (_currentIndex == null) return Container();

    return Expanded(
      child: Column(
        children: [
          AppBar(
            title: Text(_titles[_currentIndex!]),
            automaticallyImplyLeading: false,
          ),
          Expanded(
            child: _screens[_currentIndex!],
          ),
        ],
      ),
    );
  }
}

class Menu {
  String title;

  Widget screen;

  Menu({
    required this.title,
    required this.screen,
  });
}
