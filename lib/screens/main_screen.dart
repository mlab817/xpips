import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpips/presentation/widgets/logout_button.dart';
import 'package:xpips/screens/chat_screen.dart';
import 'package:xpips/screens/home_screen.dart';
import 'package:xpips/screens/notifications_screen.dart';
import 'package:xpips/screens/settings_screen.dart';

import '../application/app_router.dart';

@RoutePage()
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final _screens = [
    const HomeScreen(),
    const ChatScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
  ];

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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return AutoTabsRouter(
        routes: const [
          HomeRoute(),
          ChatRoute(),
          NotificationsRoute(),
          SettingsRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
              opacity: animation,
              // the passed child is technically our animated selected-tab page
              child: child,
            ),
        builder: (BuildContext context, child) {
          // obtain the scoped TabsRouter controller using context
          final tabsRouter = AutoTabsRouter.of(context);
          // Here we're building our Scaffold inside of AutoTabsRouter
          // to access the tabsRouter controller provided in this context
          //
          // alternatively you could use a global key

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // TODO: add PAP screen
              },
              child: const Icon(Icons.add),
            ),
            body: Row(
              children: [
                // show navigation rail on larger devices
                if (width >= 768)
                  NavigationRail(
                    onDestinationSelected: (int index) {
                      // update current index
                      tabsRouter.setActiveIndex(index);
                    },
                    leading: ClipOval(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    labelType: NavigationRailLabelType.all,
                    destinations: _destinations,
                    selectedIndex: tabsRouter.activeIndex,
                    trailing: Column(
                      children: [
                        const LogoutButton(),
                        Text(
                          'Logout',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: child,
                ),
              ],
            ),
            // show bottom navigation bar in smaller devices
            bottomNavigationBar: width < 768
                ? BottomNavigationBar(
                    onTap: (int index) {
                      // update current index
                      tabsRouter.setActiveIndex(index);
                    },
                    currentIndex: tabsRouter.activeIndex,
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
        });
  }
}
