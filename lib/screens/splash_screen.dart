import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/app_router.dart';
import '../../presentation/controllers/auth_controller.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late Timer _timer;

  void _startDelay() {
    // get user
    ref.read(authControllerProvider.notifier).getUser();

    // check if user is logged in
    final loggedIn = ref.watch(authControllerProvider).isLoggedIn;

    if (loggedIn) {
      //
      context.replaceRoute(const MainRoute());
    } else {
      //
      context.replaceRoute(const LoginRoute());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer(const Duration(seconds: 2), _startDelay);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
