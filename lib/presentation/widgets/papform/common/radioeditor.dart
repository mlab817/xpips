import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/extensions.dart';
import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/models/fullproject.dart';

class RadioEditor extends ConsumerStatefulWidget {
  const RadioEditor({
    super.key,
    required this.project,
    required this.fieldLabel,
    required this.oldValue,
    required this.onSubmit,
  });

  final FullProject project;
  final String fieldLabel;
  final bool oldValue;
  final Function(bool newValue) onSubmit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RadioEditor();
}

class _RadioEditor extends ConsumerState<RadioEditor> {
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
    return ListTile(
      subtitle: Text(widget.oldValue ? 'YES' : 'NO'),
      title: Text(widget.fieldLabel),
      trailing: IconButton(
        onPressed: () => _edit(),
        icon: const Icon(
          Icons.edit,
        ),
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

    print("oldValue $oldValue");
    print("newValue $newValue");
    print(oldValue == newValue);

    ref.listen(patchProjectControllerProvider, (previous, next) {
      //
      if (next.hasError) {
        next.showSnackbarOnError(context);
      }

      if (next.hasValue) {
        next.showSnackbarOnSuccess(context);
      }
    });

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
                child: SwitchListTile(
                  value: newValue ?? false,
                  onChanged: (bool value) {
                    print("typing $value");
                    setState(() {
                      newValue = value;
                    });
                    print("oldValue $oldValue");
                    print("newValue $newValue");
                    print(oldValue == newValue);
                  },
                  title: Text(widget.fieldLabel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
