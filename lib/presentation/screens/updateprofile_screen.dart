import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../data/requests/updateprofile_request.dart';

@RoutePage()
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _positionController;
  late TextEditingController _contactNumberController;

  UpdateProfileRequest _updateProfileRequest = UpdateProfileRequest(
      firstName: '', lastName: '', position: '', contactNumber: '');

  @override
  void initState() {
    super.initState();

    // initialize updateProfileRequest based on user profile

    _firstNameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _updateProfileRequest = _updateProfileRequest.copyWith(
              firstName: _firstNameController.text);
        });
      });
    _lastNameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _updateProfileRequest = _updateProfileRequest.copyWith(
              lastName: _lastNameController.text);
        });
      });
    _positionController = TextEditingController()
      ..addListener(() {
        setState(() {
          _updateProfileRequest = _updateProfileRequest.copyWith(
              position: _positionController.text);
        });
      });
    _contactNumberController = TextEditingController()
      ..addListener(() {
        setState(() {
          _updateProfileRequest = _updateProfileRequest.copyWith(
              contactNumber: _contactNumberController.text);
        });
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
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(label: Text('First Name')),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(label: Text('Last Name')),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _positionController,
              decoration:
                  const InputDecoration(label: Text('Designation/Position')),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _contactNumberController,
              decoration: const InputDecoration(label: Text('Contact No.')),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint('form is valid');
                  // TODO: handle submit
                }
              },
              child: const Text('Update Profile')),
        ]),
      ),
    );
  }
}
