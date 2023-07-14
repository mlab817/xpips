import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';

import '../../../application/extensions.dart';
import '../../../application/providers/bearertoken_provider.dart';
import '../../../application/app_router.dart';
import '../../../presentation/controllers/controllers.dart';
import '../widgets/logo.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscuredText = true;

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Dialog(
              backgroundColor: Colors.transparent,
              child: LoadingOverlay(),
            );
          });

      try {
        await ref.read(loginProvider.notifier).login();
      } catch (error) {
        // handle error
      } finally {
        Navigator.pop(context);
      }
    }
  }

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
                      const Logo(),
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
                              onPressed: _handleLogin,
                              child: const Text('LOGIN'),
                            ),
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
