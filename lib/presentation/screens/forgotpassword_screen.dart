import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/repositories.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';
import 'package:pips/presentation/widgets/logo.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
        context: context,
        builder: (builder) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: LoadingOverlay(),
          );
        });

    try {
      final repository = ref.watch(authRepositoryProvider);

      final response = await repository.forgotPassword(_emailController.text);

      if (mounted) {
        Navigator.pop(context); // pop the loading screen

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Status'),
                content: Text(response.status),
              );
            });
      }
    } catch (error) {
      Navigator.pop(context); // pop the loading screen

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          'Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              label: Text('Email Address')),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required.';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _handleSubmit,
                          child: const Text('SEND PASSWORD RESET LINK'),
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            AutoRouter.of(context).pushNamed('/login');
                          },
                          child: const Text('BACK TO LOGIN'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
