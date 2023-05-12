import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pips/application/extensions.dart';
import 'package:pips/application/providers/bearertoken_provider.dart';
import 'package:pips/application/providers/dio_provider.dart';
import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:pips/domain/models/login_response.dart';
import 'package:pips/presentation/controllers/auth_controller.dart';

import '../../../application/app_router.dart';
import '../../../domain/models/login_credentials.dart';
import '../controllers/loginscreen_controller.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<LoginResponse?> state =
        ref.watch(loginScreenControllerProvider);

    // show snackbar when state changes
    ref.listen<AsyncValue<LoginResponse?>>(loginScreenControllerProvider,
        (_, state) => state.showSnackbarOnError(context));

    ref.listen<AsyncValue<LoginResponse?>>(loginScreenControllerProvider,
        (_, state) {
      if (state.hasValue && state.value != null) {
        // write the bearer token to shared preferences
        ref
            .read(sharedPreferencesProvider)
            .setString('CURRENT_USER', jsonEncode(state.value!.user));

        // reload bearerToken
        ref
            .read(bearerTokenNotifierProvider.notifier)
            .setToken(state.value!.accessToken);

        // reread getDio
        ref.read(dioFactoryProvider.notifier).getDio();

        ref
            .read(authControllerProvider.notifier)
            .setCurrentUser(state.value!.user);

        AutoRouter.of(context).replace(const MainRoute());
      }
    });

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 360,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // DA logo with PIPS complying to style guide
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 110,
                          width: 125,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/logo.png',
                                    width: 64,
                                    height: 64,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/da.png',
                                height: 80,
                                width: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Public Investment Programming System',
                        textAlign: TextAlign.center,
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required.';
                          }
                          return null;
                        },
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
                              _obscuredText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            tooltip: 'Toggle show password',
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required.';
                          }
                          return null;
                        },
                        obscureText: _obscuredText,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              AutoRouter.of(context)
                                  .push(const ForgotPasswordRoute());
                            },
                            child: const Text('Forgot Password?'),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 150,
                            child: FilledButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () async {
                                      // validate
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }

                                      // showDialog(
                                      //     context: context,
                                      //     barrierDismissible: false,
                                      //     builder: (BuildContext context) {
                                      //       return const LoadingOverlay();
                                      //     });

                                      _handleLogin();

                                      ref
                                          .read(loginScreenControllerProvider
                                              .notifier)
                                          .login(_loginCredentials);

                                      return;

                                      try {
                                        // handle login
                                        await ref
                                            .read(loginScreenControllerProvider
                                                .notifier)
                                            .login(_loginCredentials);

                                        if (context.mounted) {
                                          AutoRouter.of(context)
                                              .replace(const MainRoute());
                                        }
                                      } catch (error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text(error.toString())));
                                      } finally {
                                        // remove loading dialog
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      }
                                    },
                              child: state.isLoading
                                  ? const SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('Login'),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const SignupRoute());
                        },
                        child: const Text('Create a New Account'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    //
    ref.read(loginScreenControllerProvider.notifier).login(_loginCredentials);
  }
}
