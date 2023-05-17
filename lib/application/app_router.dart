import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/models/chatroom.dart';
import '../domain/models/project.dart';
import '../presentation/screens/about_screen.dart';
import '../presentation/screens/accountrecovery_screen.dart';
import '../presentation/screens/chat_screen.dart';
import '../presentation/screens/chatroom_screen.dart';
import '../presentation/screens/forgotpassword_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/notifications_screen.dart';
import '../presentation/screens/papform_screen.dart';
import '../presentation/screens/papview_screen.dart';
import '../presentation/screens/preferences_screen.dart';
import '../presentation/screens/requestreactivation_screen.dart';
import '../presentation/screens/settings_screen.dart';
import '../presentation/screens/signup_screen.dart';
import '../presentation/screens/splash_screen.dart';
import '../presentation/screens/updatepassword_screen.dart';
import '../presentation/screens/updateprofile_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: SignupRoute.page, path: '/signup'),
        AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot-password'),
        AutoRoute(page: MainRoute.page, path: '/main', children: [
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
          AutoRoute(path: 'settings', page: SettingsRoute.page, children: [
            AutoRoute(
              path: 'update-password',
              page: UpdatePasswordRoute.page,
            ),
            AutoRoute(
              path: 'update-profile',
              page: UpdateProfileRoute.page,
            ),
            AutoRoute(
              path: 'account-recovery',
              page: AccountRecoveryRoute.page,
            ),
            AutoRoute(
              path: 'preferences',
              page: PreferencesRoute.page,
            ),
            AutoRoute(
              path: 'about',
              page: AboutRoute.page,
            ),
          ]),
        ]),
        AutoRoute(
          path: '/new-project',
          page: NewPapRoute.page,
        ),
        AutoRoute(
          path: '/project',
          page: PapViewRoute.page,
        ),
        AutoRoute(
          path: '/request-reactivation',
          page: RequestReactivationRoute.page,
        ),
      ];
}
