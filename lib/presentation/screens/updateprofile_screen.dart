import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/uploadavatar_repository.dart';
import 'package:pips/presentation/controllers/updateprofile_controller.dart';
import 'package:pips/presentation/controllers/user_controller.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateProfileScreen> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _positionController;
  late TextEditingController _contactNumberController;

  @override
  void initState() {
    super.initState();

    // define listeners for TextFormFields
    _firstNameController = TextEditingController()
      ..addListener(() {
        ref
            .read(updateProfileRequestControllerProvider.notifier)
            .update(firstName: _firstNameController.text);
      });
    _lastNameController = TextEditingController()
      ..addListener(() {
        ref
            .read(updateProfileRequestControllerProvider.notifier)
            .update(lastName: _lastNameController.text);
      });
    _positionController = TextEditingController()
      ..addListener(() {
        ref
            .read(updateProfileRequestControllerProvider.notifier)
            .update(position: _positionController.text);
      });
    _contactNumberController = TextEditingController()
      ..addListener(() {
        ref
            .read(updateProfileRequestControllerProvider.notifier)
            .update(contactNumber: _contactNumberController.text);
      });

    // delay assignment of value until the UI has been rendered
    Future.delayed(Duration.zero, () {
      _firstNameController.text =
          ref.read(updateProfileRequestControllerProvider).firstName;
      _lastNameController.text =
          ref.watch(updateProfileRequestControllerProvider).lastName;
      _positionController.text =
          ref.watch(updateProfileRequestControllerProvider).position;
      _contactNumberController.text =
          ref.watch(updateProfileRequestControllerProvider).contactNumber;
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _positionController.dispose();
    _contactNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: FadeInImage(
                          image: NetworkImage(user?.imageUrl ??
                              'https://placehold.co/150x150.png'),
                          placeholder: const AssetImage('assets/logo.png'),
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt_sharp),
                        onPressed: () async {
                          final FilePickerResult? image =
                              await FilePicker.platform.pickFiles();

                          if (image != null) {
                            final rawPath = image.files.first.path;

                            ref
                                .watch(uploadAvatarRepositoryProvider)
                                .uploadAvatar(File(rawPath!));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration:
                            const InputDecoration(label: Text('First Name')),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration:
                            const InputDecoration(label: Text('Last Name')),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: _positionController,
                        decoration: const InputDecoration(
                            label: Text('Designation/Position')),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: _contactNumberController,
                        decoration:
                            const InputDecoration(label: Text('Contact No.')),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          onPressed: () {
                            //
                            ref.read(updateProfileProvider);
                          },
                          child: const Text('Update Profile'),
                        ),
                      ),
                    ],
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

class UploadAvatarRequest {
  final List<int> rawBytes;

  UploadAvatarRequest(this.rawBytes);

  Map<String, dynamic> toJson() {
    FormData formData = FormData();

    final file =
        MultipartFile.fromBytes(rawBytes, filename: 'Authorization Form.pdf');

    MapEntry<String, MultipartFile> fileEntry = MapEntry('file', file);

    // implement Dio upload
    formData.files.add(fileEntry);

    var map = <String, dynamic>{};

    for (var file in formData.files) {
      map[file.key] = file;
    }

    return map;
  }
}
