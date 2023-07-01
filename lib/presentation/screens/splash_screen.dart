import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/app_router.dart';
import '../../../application/providers/bearertoken_provider.dart';
import '../../../presentation/widgets/loading_dialog.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(milliseconds: 1500), _goNext);
  }

  void _goNext() {
    final token = ref.watch(bearerTokenProvider);

    debugPrint("token @splashScreen: ${token.toString()}");

    // if there is a token, navigate to main route, else login route
    if (token != null) {
      AutoRouter.of(context).replace(const MainRoute());
    } else {
      AutoRouter.of(context).replace(const LoginRoute());
    }
  }

  @override
  void initState() {
    super.initState();

    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingOverlay(),
      ),
    );
  }
}
