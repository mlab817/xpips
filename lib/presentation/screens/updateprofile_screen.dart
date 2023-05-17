import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/controllers/updateprofile_controller.dart';

@RoutePage()
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
          ref.watch(updateProfileRequestControllerProvider).firstName;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                debugPrint('form is valid');
                // TODO: handle submit
                ref.read(updateProfileControllerProvider.notifier).submit();
              }
            },
            child: const Text('UPDATE'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Card(
              child: Form(
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
