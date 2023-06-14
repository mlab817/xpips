import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/models/fullproject.dart';
import 'editbutton.dart';

class SwitchEditor extends ConsumerStatefulWidget {
  const SwitchEditor({
    super.key,
    required this.project,
    required this.fieldLabel,
    required this.oldValue,
    required this.onSubmit,
    this.enabled = true,
  });

  final FullProject project;
  final String fieldLabel;
  final bool oldValue;
  final Function(bool newValue) onSubmit;
  final bool enabled;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RadioEditor();
}

class _RadioEditor extends ConsumerState<SwitchEditor> {
  void _edit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UpdateForm(
        project: widget.project,
        oldValue: widget.oldValue,
        fieldLabel: widget.fieldLabel,
        onSubmit: widget.onSubmit,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        subtitle: Text(widget.oldValue ? 'YES' : 'NO'),
        title: Text(widget.fieldLabel),
        trailing: EditButton(
          onPressed: () => _edit(),
        ),
        enabled: widget.enabled,
        onTap: () => _edit(),
      ),
    );
  }
}

class UpdateForm extends ConsumerStatefulWidget {
  const UpdateForm({
    super.key,
    required this.project,
    required this.oldValue,
    required this.fieldLabel,
    required this.onSubmit,
  });

  final FullProject project;
  final bool oldValue;
  final String fieldLabel;
  final Function(bool newValue) onSubmit;

  @override
  ConsumerState<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends ConsumerState<UpdateForm> {
  bool? oldValue;
  bool? newValue;

  @override
  void initState() {
    super.initState();

    oldValue = widget.oldValue;
    newValue = oldValue;
  }

  @override
  Widget build(BuildContext context) {
    if (oldValue == null) {
      oldValue = widget.oldValue;
      newValue = oldValue!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fieldLabel),
        actions: [
          FilledButton(
            // disable if no changes have been made
            onPressed: oldValue == newValue
                ? null
                : () {
                    widget.onSubmit(newValue ?? false);
                  },
            child: ref.watch(patchProjectControllerProvider).isLoading
                ? const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(),
                  )
                : const Text('UPDATE'),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: SwitchListTile.adaptive(
                  value: newValue ?? false,
                  onChanged: (bool value) {
                    setState(() {
                      newValue = value;
                    });
                  },
                  title: Text(widget.fieldLabel),
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
