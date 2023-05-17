import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/theme_provider.dart';

import '../../application/app_router.dart';
import '../widgets/logout_button.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';
import 'settings_screen.dart';

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
    // retrieve current user
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
            body: Row(
              children: [
                // show navigation rail on larger devices
                if (width >= 768)
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(color: Colors.black, width: 0.2))),
                    child: NavigationRail(
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
                      labelType: NavigationRailLabelType.none,
                      destinations: _destinations,
                      selectedIndex: tabsRouter.activeIndex,
                      trailing: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed:
                                  ref.read(themeProvider.notifier).switchTheme,
                              icon: ref.watch(themeProvider) == ThemeMode.dark
                                  ? const Icon(Icons.light_mode)
                                  : const Icon(Icons.dark_mode),
                              tooltip:
                                  ref.watch(themeProvider) == ThemeMode.dark
                                      ? 'Switch to Light Mode'
                                      : 'Switch to Dark Mode',
                            ),
                            const LogoutButton(),
                          ],
                        ),
                      ),
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
