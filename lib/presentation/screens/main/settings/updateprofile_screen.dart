import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../controllers/controllers.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateProfileScreen> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _positionController;
  late TextEditingController _contactNumberController;

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
      await ref
          .watch(updateProfileRequestControllerProvider.notifier)
          .updateInServer();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully updated user profile.'),
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    } finally {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();

    // define listeners for TextFormFields
    _positionController = TextEditingController();
    _positionController.addListener(() {
      ref
          .read(updateProfileRequestControllerProvider.notifier)
          .update(position: _positionController.text);
    });
    _contactNumberController = TextEditingController();
    _contactNumberController.addListener(() {
      ref
          .read(updateProfileRequestControllerProvider.notifier)
          .update(contactNumber: _contactNumberController.text);
    });

    // delay assignment of value until the UI has been rendered
    Future.delayed(Duration.zero, () {
      _positionController.text =
          ref.watch(updateProfileRequestControllerProvider).position;
      _contactNumberController.text =
          ref.watch(updateProfileRequestControllerProvider).contactNumber;
    });
  }

  @override
  void dispose() {
    _positionController.dispose();
    _contactNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isAndroid
          ? AppBar(
              title: const Text('Update Profile'),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Column(
                    children: [
                      UserProfileAvatar(),
                    ],
                  ),
                ),
              ),
              Text(
                "${ref.watch(updateProfileRequestControllerProvider).firstName} ${ref.watch(updateProfileRequestControllerProvider).lastName}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                          onPressed: _handleSubmit,
                          child: const Text('UPDATE PROFILE'),
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

class UserProfileAvatar extends ConsumerWidget {
  const UserProfileAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        _buildAvatar(ref),
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
    );
  }

  Widget _buildAvatar(ref) {
    final user = ref.watch(currentUserControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: ImageNetwork(
          image: user?.imageUrl ?? 'https://placehold.co/150x150.png',
          width: 150,
          height: 150,
        ),

        // child: FadeInImage(
        //   image: NetworkImage(
        //       user?.imageUrl ?? 'https://placehold.co/150x150.png'),
        //   placeholder: const AssetImage('assets/logo.png'),
        //   height: 150,
        //   width: 150,
        // ),
      ),
    );
  }
}
