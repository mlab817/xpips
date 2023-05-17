// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutScreen(),
      );
    },
    AccountRecoveryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountRecoveryScreen(),
      );
    },
    ChatRoomRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRoomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatRoomScreen(
          key: args.key,
          chatRoom: args.chatRoom,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    NewPapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPapScreen(),
      );
    },
    PapViewRoute.name: (routeData) {
      final args = routeData.argsAs<PapViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PapViewScreen(
          key: args.key,
          project: args.project,
        ),
      );
    },
    PreferencesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PreferencesScreen(),
      );
    },
    RequestReactivationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RequestReactivationScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    UpdatePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdatePasswordScreen(),
      );
    },
    UpdateProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateProfileScreen(),
      );
    },
  };
}

/// generated route for
/// [AboutScreen]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountRecoveryScreen]
class AccountRecoveryRoute extends PageRouteInfo<void> {
  const AccountRecoveryRoute({List<PageRouteInfo>? children})
      : super(
          AccountRecoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRecoveryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatRoomScreen]
class ChatRoomRoute extends PageRouteInfo<ChatRoomRouteArgs> {
  ChatRoomRoute({
    Key? key,
    required ChatRoom chatRoom,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoomRoute.name,
          args: ChatRoomRouteArgs(
            key: key,
            chatRoom: chatRoom,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoomRoute';

  static const PageInfo<ChatRoomRouteArgs> page =
      PageInfo<ChatRoomRouteArgs>(name);
}

class ChatRoomRouteArgs {
  const ChatRoomRouteArgs({
    this.key,
    required this.chatRoom,
  });

  final Key? key;

  final ChatRoom chatRoom;

  @override
  String toString() {
    return 'ChatRoomRouteArgs{key: $key, chatRoom: $chatRoom}';
  }
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPapScreen]
class NewPapRoute extends PageRouteInfo<void> {
  const NewPapRoute({List<PageRouteInfo>? children})
      : super(
          NewPapRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PapViewScreen]
class PapViewRoute extends PageRouteInfo<PapViewRouteArgs> {
  PapViewRoute({
    Key? key,
    required Project project,
    List<PageRouteInfo>? children,
  }) : super(
          PapViewRoute.name,
          args: PapViewRouteArgs(
            key: key,
            project: project,
          ),
          initialChildren: children,
        );

  static const String name = 'PapViewRoute';

  static const PageInfo<PapViewRouteArgs> page =
      PageInfo<PapViewRouteArgs>(name);
}

class PapViewRouteArgs {
  const PapViewRouteArgs({
    this.key,
    required this.project,
  });

  final Key? key;

  final Project project;

  @override
  String toString() {
    return 'PapViewRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [PreferencesScreen]
class PreferencesRoute extends PageRouteInfo<void> {
  const PreferencesRoute({List<PageRouteInfo>? children})
      : super(
          PreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreferencesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RequestReactivationScreen]
class RequestReactivationRoute extends PageRouteInfo<void> {
  const RequestReactivationRoute({List<PageRouteInfo>? children})
      : super(
          RequestReactivationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestReactivationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdatePasswordScreen]
class UpdatePasswordRoute extends PageRouteInfo<void> {
  const UpdatePasswordRoute({List<PageRouteInfo>? children})
      : super(
          UpdatePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdatePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateProfileScreen]
class UpdateProfileRoute extends PageRouteInfo<void> {
  const UpdateProfileRoute({List<PageRouteInfo>? children})
      : super(
          UpdateProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
