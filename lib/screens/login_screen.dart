import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpips/application/app_router.dart';
import 'package:xpips/domain/models/login_credentials.dart';
import 'package:xpips/presentation/controllers/auth_controller.dart';

import '../presentation/widgets/loading_dialog.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  LoginCredentials _loginCredentials =
      LoginCredentials(username: '', password: '');

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  bool _obscuredText = true;

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _loginCredentials =
              _loginCredentials.copyWith(username: _usernameController.text);
        });
      });
    _passwordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _loginCredentials =
              _loginCredentials.copyWith(password: _passwordController.text);
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Public Investment Programming System',
                  style: TextStyle(
                    fontFamily: GoogleFonts.bebasNeue().fontFamily,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Login to your PIPS Account'),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                  autofocus: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscuredText = !_obscuredText;
                        });
                      },
                      icon: Icon(
                        _obscuredText ? Icons.visibility : Icons.visibility_off,
                      ),
                      tooltip: 'Toggle show password',
                    ),
                  ),
                  obscureText: _obscuredText,
                ),
                const SizedBox(
                  height: 30,
                ),
                FilledButton(
                  onPressed: () async {
                    // TODO: handle login
                    final authController = ref.watch(authControllerProvider);

                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const LoadingOverlay();
                        });

                    try {
                      await authController.login(_loginCredentials);
                    } catch (error) {
                      // TODO: handle error case
                    } finally {
                      Navigator.of(context, rootNavigator: true).pop();

                      AutoRouter.of(context).replace(const MainRoute());
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      // TODO: go to forgot password
                      Navigator.of(context).pushNamed('/forgot-password');
                    },
                    child: const Text('Forgot Password?')),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      // TODO: go to sign up
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: const Text('Sign up')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
