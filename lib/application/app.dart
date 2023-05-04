import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../presentation/controllers/auth_controller.dart';
import 'app_router.dart';

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    debugPrint(currentUser.toString());

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
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x00F7931E),
        ),
        appBarTheme: const AppBarTheme(elevation: 0),
        inputDecorationTheme: const InputDecorationTheme(
            // TODO: customize input decoration theme
            ),
      ),
      // routerDelegate: AutoRouterDelegate.declarative(_appRouter,
      //     routes: (_) => [
      //           if (ref.watch(authControllerProvider).isLoggedIn)
      //             const MainRoute()
      //           else
      //             const SplashRoute(),
      //         ]),
      // routeInformationParser:
      //     _appRouter.defaultRouteParser(includePrefixMatches: true),
      routerConfig: _appRouter.config(),
      // home: currentUser != null ? const MainScreen() : const LoginScreen(),
      // TODO: replace with auto route
    );
  }
}
