import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/extensions.dart';

import '../../application/app_router.dart';
import '../../domain/models/office.dart';
import '../controllers/controllers.dart';

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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final data = ref.watch(signupRequestControllerProvider);

    if (kDebugMode) {
      print(data);
    }

    ref.listen(signupControllerProvider, (_, state) {
      if (state.hasError) return state.showSnackbarOnError(context);

      if (state.hasValue) return state.showSnackbarOnSuccess(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width <= 400 ? width : 400,
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
                              initialValue: ref
                                  .watch(signupRequestControllerProvider)
                                  .firstName,
                              decoration: const InputDecoration(
                                label: Text('First Name'),
                              ),
                              onChanged: (String? value) {
                                ref
                                    .read(signupRequestControllerProvider
                                        .notifier)
                                    .update(firstName: value);
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
                                ref
                                    .read(signupRequestControllerProvider
                                        .notifier)
                                    .update(lastName: value);
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
                          ref
                              .read(signupRequestControllerProvider.notifier)
                              .update(position: value);
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
                          ref
                              .read(signupRequestControllerProvider.notifier)
                              .update(email: value);
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
                          ref
                              .read(signupRequestControllerProvider.notifier)
                              .update(contactNumber: value);
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
                          ref
                              .read(signupRequestControllerProvider.notifier)
                              .update(username: value);
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
                          ref
                              .read(signupRequestControllerProvider.notifier)
                              .update(password: value);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return OfficeBottomSheet(
                                  onSelect: (Office? office) {
                                // set the office
                                setState(() {
                                  _office = office;
                                });
                                Navigator.of(context).pop();
                              });
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Text(
                                _office != null
                                    ? _office!.name
                                    : 'Select Office',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.apply(
                                        color: Theme.of(context).primaryColor),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_drop_down_sharp),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: _pickFile,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Authorization Form',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.apply(
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                  const Spacer(),
                                  ref
                                          .watch(
                                              authorizationFileUploadControllerProvider)
                                          .isLoading
                                      ? const CircularProgressIndicator()
                                      : const Icon(Icons.attach_file),
                                ],
                              ),
                              ref
                                  .watch(
                                      authorizationFileUploadControllerProvider)
                                  .when(data: (data) {
                                return Text(
                                  data?.path ?? 'NO FILE',
                                  textAlign: TextAlign.start,
                                );
                              }, error: (error, stacktrace) {
                                return Text(error.toString());
                              }, loading: () {
                                return Container();
                              }),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            // disable if file is being uploaded
                            onPressed: ref
                                    .watch(signupControllerProvider)
                                    .isLoading
                                ? null
                                : () {
                                    ref
                                        .read(signupControllerProvider.notifier)
                                        .submit();
                                  },
                            child: ref.watch(signupControllerProvider).isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator())
                                : const Text('Sign up'),
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              AutoRouter.of(context).push(const LoginRoute());
                            },
                            child: const Text('Back to Login'),
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
    );
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

      ref
          .read(authorizationFileUploadControllerProvider.notifier)
          .upload(result.files.first);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No file selected.'),
          ),
        );
      }
    }
  }
}

class OfficeBottomSheet extends ConsumerWidget {
  const OfficeBottomSheet({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final Function(Office? office) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offices = ref.watch(filteredOfficesProvider);

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: TextField(
          onChanged: (String value) {
            ref.read(officeFilterProvider.notifier).state = value;
          },
        ),
      ),
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: offices.length,
          itemBuilder: (context, index) {
            final office = offices[index];

            return ListTile(
              title: Text(office.acronym),
              subtitle: Text(office.name),
              onTap: () {
                ref
                    .read(signupRequestControllerProvider.notifier)
                    .update(officeId: office.id);
                // handleTap
                onSelect(office);
              },
            );
          },
        ),
      ),
    ]);
  }
}
