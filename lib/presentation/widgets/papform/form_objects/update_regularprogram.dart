import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/fullproject.dart';

class UpdateRegularProgram extends StatefulWidget {
  const UpdateRegularProgram({super.key, required this.project});

  final FullProject project;

  @override
  State<UpdateRegularProgram> createState() => _UpdateRegularProgramState();
}

class _UpdateRegularProgramState extends State<UpdateRegularProgram> {
  void edit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UpdateRegularProgramForm(
          oldValue: widget.project.regularProgram ?? false);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Regular Program'),
      subtitle: Text(widget.project.regularProgram != null &&
              widget.project.regularProgram!
          ? 'YES'
          : 'NO'),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: edit,
      ),
      onTap: () {},
    );
  }
}

class UpdateRegularProgramForm extends ConsumerStatefulWidget {
  const UpdateRegularProgramForm({Key? key, required this.oldValue})
      : super(key: key);

  final bool oldValue;

  @override
  ConsumerState createState() => _UpdateRegularProgramFormState();
}

class _UpdateRegularProgramFormState
    extends ConsumerState<UpdateRegularProgramForm> {
  late bool newValue;

  @override
  void initState() {
    super.initState();
    newValue = widget.oldValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regular Program'),
        actions: [
          FilledButton(
            onPressed: widget.oldValue == newValue
                ? null
                : () {
                    // Perform update logic here
                  },
            child: const Text('UPDATE'),
          ),
        ],
      ),
      body: Material(
        child: SwitchListTile(
          title: const Text('This is a regular program'),
          value: newValue,
          onChanged: (bool value) {
            setState(() {
              newValue = value;
            });
          },
        ),
      ),
    );
  }
}
