
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/bearertoken_provider.dart';

import '../../../application/app_router.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ref.read(bearerTokenNotifierProvider.notifier).getTokenFromSharedPrefs();
    // final user = ref.watch(authControllerProvider);

    final token = ref.watch(bearerTokenNotifierProvider);

    debugPrint("token @splashScreen: ${token.toString()}");

    // if there is a token, navigate to main route, else login route
    if (token != null) {
      AutoRouter.of(context).replace(const MainRoute());
    } else {
      AutoRouter.of(context).replace(const LoginRoute());
    }

    return Container();
  }
}
