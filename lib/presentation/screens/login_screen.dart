import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/extensions.dart';
import '../../../application/providers/bearertoken_provider.dart';
import '../../../application/app_router.dart';
import '../../../presentation/controllers/controllers.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscuredText = true;

  @override
  Widget build(BuildContext context) {
    // show snackbar when state changes
    ref.listen(loginProvider, (_, state) => state.showSnackbarOnError(context));

    ref.listen(loginProvider, (previous, next) {
      if (!next.isLoading && !next.hasError) {
        if (next.value != null) {
          // set the bearer token
          ref
              .read(bearerTokenProvider.notifier)
              .setToken(next.value!.accessToken);

          ref.invalidate(currentUserProvider);
        }
      }
    });

    ref.listen(currentUserProvider, (previous, next) {
      print("currentUserProvider previous: $previous");
      print("currentUserProvider next: $next");
      if (next != null) {
        AutoRouter.of(context).push(const MainRoute());
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
                        'Public Investment Program System',
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
                        onChanged: (String? value) {
                          ref
                              .read(loginRequestControllerProvider.notifier)
                              .update(username: value);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
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
                        onChanged: (String? value) {
                          ref
                              .read(loginRequestControllerProvider.notifier)
                              .update(password: value);
                        },
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
                              onPressed: () {
                                ref.read(loginProvider.notifier).login();
                              },
                              child: ref.watch(loginProvider).isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('LOGIN'),
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
}
