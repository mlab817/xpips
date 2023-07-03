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
    NewPapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPapScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
    CommentsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CommentsRouteArgs>(
          orElse: () => CommentsRouteArgs(uuid: pathParams.getString('uuid')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentsScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    RequestReactivationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RequestReactivationScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    ArchiveRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArchiveScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    PapViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PapViewRouteArgs>(
          orElse: () => PapViewRouteArgs(uuid: pathParams.getString('uuid')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PapViewScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    PapEvaluationRoute.name: (routeData) {
      final args = routeData.argsAs<PapEvaluationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PapEvaluationScreen(
          key: args.key,
          project: args.project,
        ),
      );
    },
  };
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
/// [CommentsScreen]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    Key? key,
    required String uuid,
    List<PageRouteInfo>? children,
  }) : super(
          CommentsRoute.name,
          args: CommentsRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

  static const PageInfo<CommentsRouteArgs> page =
      PageInfo<CommentsRouteArgs>(name);
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    required this.uuid,
  });

  final Key? key;

  final String uuid;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, uuid: $uuid}';
  }
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
/// [ArchiveScreen]
class ArchiveRoute extends PageRouteInfo<void> {
  const ArchiveRoute({List<PageRouteInfo>? children})
      : super(
          ArchiveRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArchiveRoute';

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
/// [PapViewScreen]
class PapViewRoute extends PageRouteInfo<PapViewRouteArgs> {
  PapViewRoute({
    Key? key,
    required String uuid,
    List<PageRouteInfo>? children,
  }) : super(
          PapViewRoute.name,
          args: PapViewRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'PapViewRoute';

  static const PageInfo<PapViewRouteArgs> page =
      PageInfo<PapViewRouteArgs>(name);
}

class PapViewRouteArgs {
  const PapViewRouteArgs({
    this.key,
    required this.uuid,
  });

  final Key? key;

  final String uuid;

  @override
  String toString() {
    return 'PapViewRouteArgs{key: $key, uuid: $uuid}';
  }
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
/// [PapEvaluationScreen]
class PapEvaluationRoute extends PageRouteInfo<PapEvaluationRouteArgs> {
  PapEvaluationRoute({
    Key? key,
    required FullProject project,
    List<PageRouteInfo>? children,
  }) : super(
          PapEvaluationRoute.name,
          args: PapEvaluationRouteArgs(
            key: key,
            project: project,
          ),
          initialChildren: children,
        );

  static const String name = 'PapEvaluationRoute';

  static const PageInfo<PapEvaluationRouteArgs> page =
      PageInfo<PapEvaluationRouteArgs>(name);
}

class PapEvaluationRouteArgs {
  const PapEvaluationRouteArgs({
    this.key,
    required this.project,
  });

  final Key? key;

  final FullProject project;

  @override
  String toString() {
    return 'PapEvaluationRouteArgs{key: $key, project: $project}';
  }
}
