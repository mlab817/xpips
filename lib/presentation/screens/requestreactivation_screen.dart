import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pips/data/requests/upload_request.dart';

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

  final List<XFile> _list = [];

  bool _dragging = false;

  String? _uploadedPath;
  String? _uploadError;

  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
      _uploadedPath = next.value?.path;
    });

    // TODO: add email and upload
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
                      const Text('Request for Account Reactivation'),
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
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowMultiple: false);

                          if (result != null) {
                            debugPrint('result is not null');

                            // upload the file and assign the path to the value of this TextFormField
                            final response = await ref
                                .read(reactivationFileUploadControllerProvider
                                    .notifier)
                                .upload(
                                  UploadRequest(
                                    file: result.files.first.bytes!.toList(),
                                  ),
                                );

                            debugPrint('response is: $response');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(requestReactivationController.notifier)
                                  .submit();
                            }
                          },
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
