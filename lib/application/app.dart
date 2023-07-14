import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/config.dart';
import 'package:pips/application/providers/theme_provider.dart';
import 'package:pips/presentation/controllers/currentuser_controller.dart';
import 'package:pips/presentation/controllers/theme_controller.dart';
import 'package:screen_capturer/screen_capturer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_router.dart';

enum MenuSelection {
  about,
  showMessage,
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  String _message = 'Hello';
  bool _showMessage = false;

  void _handleMenuSelection(MenuSelection value) {
    switch (value) {
      case MenuSelection.about:
        showAboutDialog(
          context: context,
          applicationName: 'MenuBar Sample',
          applicationVersion: '1.0.0',
        );
      case MenuSelection.showMessage:
        setState(() {
          _showMessage = !_showMessage;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);

    final AppRouter appRouter = AppRouter(isAuthenticated: currentUser != null);

    return MaterialApp.router(
      title: 'PIPS',
      // enable all possible scroll triggers
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
          PointerDeviceKind.trackpad,
        },
      ),
      // debugShowMaterialGrid: true,
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      // set to true until further notice
      themeMode: ref.watch(themeControllerProvider),
      // dark theme
      darkTheme: ref.watch(darkThemeProvider),
      // light theme
      theme: ref.watch(lightThemeProvider),
      routerConfig: appRouter.config(),
      builder: (context, child) {
        return PlatformMenuBar(
          menus: <PlatformMenuItem>[
            PlatformMenu(
              label: 'PIPS',
              menus: <PlatformMenuItem>[
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      label: 'About',
                      onSelected: () {
                        showAboutDialog(
                          context: context,
                          applicationName: 'PIPS',
                        );
                      },
                    ),
                  ],
                ),
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      label: 'Take Screenshot',
                      shortcut: const SingleActivator(LogicalKeyboardKey.keyS,
                          meta: true),
                      onSelected: () async {
                        // check if user is allowed to make a screenshot
                        if (await screenCapturer.isAccessAllowed()) {
                          await screenCapturer.requestAccess();
                        }

                        CapturedData? capturedData =
                            await screenCapturer.capture(
                          mode: CaptureMode.window,
                          // imagePath: '',
                          copyToClipboard: true,
                          silent: true,
                        );

                        if (mounted) {
                          if (capturedData != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Copied to clipboard')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Failed to capture image')));
                          }
                        }
                      },
                    ),
                  ],
                ),
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      onSelected: () {
                        _handleMenuSelection(MenuSelection.showMessage);
                      },
                      shortcut: const CharacterActivator('m'),
                      label: _showMessage ? 'Hide Message' : 'Show Message',
                    ),
                    PlatformMenu(
                      label: 'Messages',
                      menus: <PlatformMenuItem>[
                        PlatformMenuItem(
                          label: 'I am not throwing away my shot.',
                          shortcut: const SingleActivator(
                              LogicalKeyboardKey.digit1,
                              meta: true),
                          onSelected: () {
                            setState(() {
                              _message = 'I am not throwing away my shot.';
                            });
                          },
                        ),
                        PlatformMenuItem(
                          label:
                              "There's a million things I haven't done, but just you wait.",
                          shortcut: const SingleActivator(
                              LogicalKeyboardKey.digit2,
                              meta: true),
                          onSelected: () {
                            setState(() {
                              _message =
                                  "There's a million things I haven't done, but just you wait.";
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      label: 'User Guide',
                      onSelected: () async {
                        final url =
                            '${ref.watch(configProvider).baseUrl}/user-guides';
                        final uri = Uri.parse(url);

                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri);
                        }
                      },
                    ),
                  ],
                ),
                if (PlatformProvidedMenuItem.hasMenu(
                    PlatformProvidedMenuItemType.quit))
                  const PlatformProvidedMenuItem(
                      type: PlatformProvidedMenuItemType.quit),
              ],
            ),
          ],
          child: child,
        );
      },
    );
  }
}
