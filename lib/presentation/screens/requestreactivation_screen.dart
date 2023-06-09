import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pips/application/extensions.dart';

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

  @override
  void initState() {

    super.initState();

    _emailController.addListener(() {
      ref
          .read(reactivationRequestControllerProvider.notifier)
          .update(email: _emailController.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    ref.listen(reactivationFileUploadControllerProvider, (previous, next) {
      debugPrint(next.toString());
      //
      ref
          .read(reactivationRequestControllerProvider.notifier)
          .update(authorization: next.value?.path ?? '');
    });

    ref.listen(requestReactivationControllerProvider, (previous, next) {
      if (next.hasError) {
        next.showSnackbarOnError(context);
      }
      if (next.hasValue) {
        next.showSnackbarOnSuccess(context);
      }
    });

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 360,
          ),
          child: Form(
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
                        child: Text('REQUEST FOR ACCOUNT REACTIVATION'),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          label: Text('Email Address'),
                        ),
                        onChanged: (String? value) {
                          ref
                              .read(reactivationRequestControllerProvider
                                  .notifier)
                              .update(email: value);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Authorization Form'),
                        subtitle: ref
                                .watch(reactivationRequestControllerProvider)
                                .authorization
                                .isNotEmpty
                            ? Text(ref
                                .watch(reactivationRequestControllerProvider)
                                .authorization)
                            : const Text('Select file'),
                        trailing: const Icon(Icons.attach_file),
                        onTap: () async {
                          // select file
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );

                          if (result != null) {
                            debugPrint('result is not null');

                            // upload the file and assign the path to the value of this TextFormField
                            final response = await ref
                                .read(reactivationFileUploadControllerProvider
                                    .notifier)
                                .upload(result.files.first);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _emailController.text.isNotEmpty &&
                                  ref
                                      .watch(
                                          reactivationRequestControllerProvider)
                                      .authorization
                                      .isNotEmpty
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    ref
                                        .read(
                                            requestReactivationControllerProvider
                                                .notifier)
                                        .submit();
                                  }
                                }
                              : null,
                          child: const Text('Submit'),
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
}
