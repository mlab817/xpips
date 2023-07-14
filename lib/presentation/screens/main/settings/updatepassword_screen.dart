import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/controllers/updatepassword_controller.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';
import 'package:universal_io/io.dart';

class UpdatePasswordScreen extends ConsumerStatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdatePasswordScreen> createState() =>
      _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends ConsumerState<UpdatePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _currentPasswordController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmationController;

  bool _passwordIsObscured = true;

  void _togglePasswordObscurity(bool? value) {
    setState(() {
      _passwordIsObscured = value ?? false;
    });
  }

  Future<void> _handleSubmit() async {
    // handle submit
    if (!_formKey.currentState!.validate()) return;

    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: LoadingOverlay(),
          );
        });

    try {
      // handle submit
      final response = await ref
          .read(updatePasswordRepositoryProvider)
          .submit(ref.watch(updatePasswordControllerProvider));

      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.message)));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    } finally {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();

    _currentPasswordController = TextEditingController();
    _currentPasswordController.addListener(() {
      ref
          .read(updatePasswordControllerProvider.notifier)
          .update(currentPassword: _currentPasswordController.text);
    });
    _passwordController = TextEditingController();
    _passwordController.addListener(() {
      ref
          .read(updatePasswordControllerProvider.notifier)
          .update(password: _passwordController.text);
    });
    _passwordConfirmationController = TextEditingController();
    _passwordConfirmationController.addListener(() {
      ref
          .read(updatePasswordControllerProvider.notifier)
          .update(passwordConfirmation: _passwordConfirmationController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();

    _currentPasswordController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(ref.watch(updatePasswordControllerProvider));

    return Scaffold(
      appBar: Platform.isAndroid
          ? AppBar(
              title: const Text('Update Password'),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _currentPasswordController,
                  decoration: const InputDecoration(
                    label: Text('Current Password'),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                  obscureText: _passwordIsObscured,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    label: Text('New Password'),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                  obscureText: _passwordIsObscured,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordConfirmationController,
                  decoration: const InputDecoration(
                    label: Text('Confirm Password'),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                  obscureText: _passwordIsObscured,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _togglePasswordObscurity(!_passwordIsObscured);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: !_passwordIsObscured,
                        onChanged: null,
                      ),
                      const Text('Show Password')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: _handleSubmit,
                  child: const Text('UPDATE PASSWORD'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
