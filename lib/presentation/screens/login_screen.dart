import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pips/application/extensions.dart';
import 'package:pips/application/providers/bearertoken_provider.dart';
import 'package:pips/application/providers/dio_provider.dart';
import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:pips/presentation/controllers/auth_controller.dart';

import '../../../application/app_router.dart';
import '../controllers/loginscreen_controller.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  bool _obscuredText = true;

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController()
      ..addListener(() {
        ref
            .read(loginCredentialsControllerProvider.notifier)
            .update(username: _usernameController.text);
      });
    _passwordController = TextEditingController()
      ..addListener(() {
        ref
            .read(loginCredentialsControllerProvider.notifier)
            .update(password: _passwordController.text);
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
    final state = ref.watch(loginControllerProvider);

    // show snackbar when state changes
    ref.listen(loginControllerProvider,
        (_, state) => state.showSnackbarOnError(context));

    ref.listen(loginControllerProvider, (_, state) {
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
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required.';
                          }
                          return null;
                        },
                        autofocus: kIsWeb, // autofocus on web
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscuredText = !_obscuredText;
                              });
                            },
                            child: Icon(
                              _obscuredText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
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

                                      _handleLogin();
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
                        height: 15,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const SignupRoute());
                        },
                        child: const Text('Create a New Account'),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context)
                              .push(const RequestReactivationRoute());
                        },
                        child: const Text('Request to Reactivate Account'),
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
    try {
      //
      ref.read(loginControllerProvider.notifier).login();
    } catch (error) {
      print(error);
    }
  }
}
