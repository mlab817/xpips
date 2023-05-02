import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpips/application/providers/active_menu_index.dart';
import 'package:xpips/presentation/controllers/auth_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<NavigationRailDestination> _destinations =
      const <NavigationRailDestination>[
    NavigationRailDestination(
      icon: Icon(Icons.home),
      label: Text('Home'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.chat_bubble),
      label: Text('Chat'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.notifications),
      label: Text('Notifications'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.settings),
      label: Text('Settings'),
    ),
  ];

  Future<void> _handleLogout() async {
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
    } else {
      print('Cancelled');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final currentIndex = ref.watch(activeMenuIndexProvider);

    return Scaffold(
      appBar: (width < 768)
          ? AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  onPressed: () {
                    // TODO: handle logout
                    _handleLogout();
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Row(
        children: [
          // show navigation rail on larger devices
          if (width >= 768)
            NavigationRail(
              onDestinationSelected: (int index) {
                // update current index
                ref.read(activeMenuIndexProvider.notifier).state = index;
              },
              leading: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  height: 50,
                  width: 50,
                ),
              ),
              labelType: NavigationRailLabelType.all,
              destinations: _destinations,
              selectedIndex: currentIndex,
              trailing: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO: handle logout
                      _handleLogout();
                    },
                    icon: const Icon(Icons.exit_to_app),
                  ),
                  Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          Expanded(
            child: Center(
              child: Text("${width.toString()} px"),
            ),
          ),
        ],
      ),
      // show bottom navigation bar in smaller devices
      bottomNavigationBar: width < 768
          ? BottomNavigationBar(
              onTap: (int index) {
                // update current index
                ref.read(activeMenuIndexProvider.notifier).state = index;
              },
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            )
          : null,
    );
  }
}
