import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/theme_provider.dart';
import 'package:pips/presentation/controllers/currentuser_controller.dart';
import 'package:pips/presentation/controllers/theme_controller.dart';

import 'app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    );
  }
}
