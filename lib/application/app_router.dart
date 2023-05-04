import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/models/chatroom.dart';
import '../screens/about_screen.dart';
import '../screens/accountrecovery_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/chatroom_screen.dart';
import '../screens/forgotpassword_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/updatepassword_screen.dart';
import '../screens/updateprofile_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(path: 'home', page: HomeRoute.page),
          AutoRoute(path: 'chats', page: ChatRoute.page),
          AutoRoute(path: 'notifications', page: NotificationsRoute.page),
          AutoRoute(
            path: 'settings',
            page: SettingsRoute.page,
          ),
        ]),
        AutoRoute(path: '/update-password', page: UpdatePasswordRoute.page),
        AutoRoute(path: '/update-profile', page: UpdateProfileRoute.page),
        AutoRoute(path: '/account-recovery', page: AccountRecoveryRoute.page),
        AutoRoute(path: '/about', page: AboutRoute.page),
        AutoRoute(page: ChatRoomRoute.page),
      ];
}
