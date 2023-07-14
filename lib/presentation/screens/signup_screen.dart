import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/repositories.dart';
import '../../data/requests/requests.dart';
import '../../presentation/widgets/loading_dialog.dart';
import '../../presentation/widgets/logo.dart';
import '../../application/app_router.dart';
import '../../domain/entities/models.dart';
import '../widgets/signupbottomsheet.dart';

@RoutePage()
class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Office? _office;

  // hold state for tracking file upload
  bool _obscuredPassword = true;

  SignupRequest _signupRequest = SignupRequest.initial();

  Future<void> _handleSignup() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: LoadingOverlay(),
          );
        });

    final repository = ref.watch(authRepositoryProvider);

    try {
      await repository.signup(_signupRequest);

      if (mounted) {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text(
                    'Please wait for verification email to be sent to your registered email.'),
              );
            });
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));

      Navigator.pop(context);
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png'],
    );

    if (result != null) {
      print(result);
      // set uploading status
      // only works on web

      /// note: file uploads work differently based on platform particularly on web
      /// files uploaded on web do not have access to path so the file is the one
      /// being stored in memory. so web has access to bytes whereas other platforms
      /// have access to path
      try {
        final repository = ref.watch(uploadRepositoryProvider);

        final response = await repository.upload(result.files.first);

        if (response != null) {
          setState(() {
            _signupRequest =
                _signupRequest.copyWith(authorization: response.path);
          });
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
            ),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No file selected.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    print(_signupRequest);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 400, minWidth: 300),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      label: Text('First Name'),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _signupRequest = _signupRequest
                                            .copyWith(firstName: value ?? '');
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      label: Text('Last Name'),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _signupRequest = _signupRequest
                                            .copyWith(lastName: value ?? '');
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Position/Designation'),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _signupRequest = _signupRequest.copyWith(
                                      position: value ?? '');
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Email Address'),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _signupRequest = _signupRequest.copyWith(
                                      email: value ?? '');
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Contact Number'),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _signupRequest = _signupRequest.copyWith(
                                      contactNumber: value ?? '');
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Username'),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _signupRequest = _signupRequest.copyWith(
                                      username: value ?? '');
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  label: const Text('Password'),
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _obscuredPassword = !_obscuredPassword;
                                      });
                                    },
                                    child: Icon(!_obscuredPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  )),
                              obscureText: _obscuredPassword,
                              onChanged: (String? value) {
                                setState(() {
                                  _signupRequest = _signupRequest.copyWith(
                                      password: value ?? '');
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: _selectOffice,
                              title: const Text('Office'),
                              subtitle: Text(
                                _office != null
                                    ? _office!.acronym
                                    : 'Select Office',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.apply(
                                        color: Theme.of(context).primaryColor,
                                        overflow: TextOverflow.ellipsis),
                              ),
                              trailing: const Icon(Icons.arrow_drop_down_sharp),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Authorization Form'),
                              subtitle: Text(_signupRequest.authorization ??
                                  'NO ATTACHMENT'),
                              trailing: const Icon(Icons.attach_file),
                              onTap: _pickFile,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                  // disable if file is being uploaded
                                  onPressed: _signupRequest.isValid
                                      ? _handleSignup
                                      : null,
                                  child: _signupRequest.isValid
                                      ? const Text('Sign up')
                                      : const Text('Fill up all fields'),
                                ),
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    AutoRouter.of(context)
                                        .push(const LoginRoute());
                                  },
                                  child: const Text('BACK TO LOGIN'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectOffice() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SignupBottomSheet(onSelect: (Office? office) {
          if (office != null) {
            setState(() {
              _office = office;
              _signupRequest = _signupRequest.copyWith(officeId: office!.id);
            });
          }

          Navigator.of(context).pop();
        });
      },
    );
  }
}
