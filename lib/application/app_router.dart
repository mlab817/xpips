import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/chat_screen.dart';
import '../presentation/screens/forgotpassword_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/newpap_screen.dart';
import '../presentation/screens/notifications_screen.dart';
import '../presentation/screens/papedit_screen.dart';
import '../presentation/screens/papview_screen.dart';
import '../presentation/screens/requestreactivation_screen.dart';
import '../presentation/screens/settings_screen.dart';
import '../presentation/screens/signup_screen.dart';
import '../presentation/screens/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  final bool isAuthenticated;

  AppRouter({required this.isAuthenticated});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: SignupRoute.page, path: '/signup'),
        AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot-password'),
        AutoRoute(
          guards: [],
          page: MainRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'chats',
              page: ChatRoute.page,
            ),
            AutoRoute(
              path: 'notifications',
              page: NotificationsRoute.page,
            ),
            AutoRoute(
              path: 'settings',
              page: SettingsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/new-project',
          page: NewPapRoute.page,
        ),
        AutoRoute(
          path: '/project/:uuid',
          page: PapViewRoute.page,
        ),
        AutoRoute(
          path: '/project/:uuid/edit',
          page: PapEditRoute.page,
        ),
        AutoRoute(
          path: '/request-reactivation',
          page: RequestReactivationRoute.page,
        ),
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final publicRoutes = <String>[
      LoginRoute.name,
      SplashRoute.name,
      SignupRoute.name,
    ];

    if (isAuthenticated || publicRoutes.contains(resolver.route.name)) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
