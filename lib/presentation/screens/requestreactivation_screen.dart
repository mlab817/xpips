import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/app_router.dart';
import 'package:pips/application/extensions.dart';
import 'package:pips/data/repositories/repositories.dart';
import 'package:pips/data/requests/requests.dart';
import 'package:pips/data/responses/responses.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';
import 'package:pips/presentation/widgets/logo.dart';

import '../controllers/reactivationrequest_controller.dart';

@RoutePage()
class RequestReactivationScreen extends ConsumerStatefulWidget {
  const RequestReactivationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RequestReactivationScreen> createState() =>
      _RequestReactivationScreenState();
}

class _RequestReactivationScreenState
    extends ConsumerState<RequestReactivationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  bool _uploading = false;
  bool _emailIsValid = false;

  ReactivationRequest _reactivationRequest =
      ReactivationRequest(email: '', authorization: '');

  void _backToLogin() {
    AutoRouter.of(context).replace(const LoginRoute());
  }

  Future<void> _handleFileUpload() async {
    // select file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _uploading = true;
      });

      try {
        // upload the file and assign the path to the value of this TextFormField
        final response =
            await ref.read(uploadRepositoryProvider).upload(result.files.first);

        if (response != null) {
          setState(() {
            _uploading = false;
            _reactivationRequest =
                _reactivationRequest.copyWith(authorization: response.path);
          });
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.toString())));
        }
      } finally {
        setState(() {
          _uploading = false;
        });
      }
    }
  }

  Future<void> _validateEmail(value) async {
    final ValidateEmailResponse response =
        await ref.read(authRepositoryProvider).validateEmail(value);

    setState(() {
      _emailIsValid = response.exists; // bool
    });
  }

  Future<void> _handleSubmit() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: LoadingOverlay(),
          );
        });

    try {
      final ReactivationResponse response = await ref
          .read(requestReactivationControllerProvider.notifier)
          .submit(_reactivationRequest);

      if (mounted) {
        // pop loading screen
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(response.status),
                actions: [
                  FilledButton(
                      onPressed: _backToLogin, child: Text('BACK TO LOGIN')),
                ],
              );
            });
      }
    } catch (error) {
      Navigator.pop(context);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      _reactivationRequest =
          _reactivationRequest.copyWith(email: _emailController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_reactivationRequest);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 360,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                'Can\'t login because account is deactivated? No problem. Just let us know your email address, upload your authorization form, and we will reactivate your account shortly.'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              label: const Text('Email Address'),
                              suffixIcon: _emailIsValid
                                  ? Icon(
                                      Icons.check_circle_outlined,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : InkWell(
                                      onTap: () =>
                                          _validateEmail(_emailController.text),
                                      child:
                                          const Icon(Icons.play_circle_outline),
                                    ),
                            ),
                            onChanged: (String value) {
                              // every time that the value is changing, set _emailIsValid to false
                              setState(() {
                                _emailIsValid = false;
                              });
                            },
                            onFieldSubmitted: (String value) =>
                                _validateEmail(value),
                            validator: (_) => _emailIsValid
                                ? 'Email does not exist'
                                : 'Email exists',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AnimatedOpacity(
                            opacity: _emailIsValid ? 1.0 : 0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: ListTile(
                              title: const Text('Authorization Form'),
                              subtitle:
                                  _reactivationRequest.authorization.isNotEmpty
                                      ? Text(_reactivationRequest.authorization)
                                      : const Text('Select file'),
                              trailing: _uploading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Icon(Icons.attach_file),
                              onTap: _emailIsValid ? _handleFileUpload : null,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AnimatedOpacity(
                            opacity: _reactivationRequest.isValid ? 1.0 : 0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: _reactivationRequest.isValid
                                    ? _handleSubmit
                                    : null,
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: _backToLogin,
                              child: const Text('Back to Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
