import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/common/editbutton.dart';

import '../../../../domain/entities/models.dart';
import '../../../controllers/patchproject_controller.dart';

class NestedCheckboxEditor extends ConsumerStatefulWidget {
  const NestedCheckboxEditor({
    super.key,
    required this.project,
    required this.fieldLabel,
    required this.options,
    required this.oldValue,
    required this.onSubmit,
    this.enabled = true,
  });

  final FullProject project;
  final String fieldLabel;
  final List<Option> oldValue;
  final List<Option> options;
  final Function(List<Option> newValue) onSubmit;
  final bool enabled;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NestedCheckboxEditorState();
}

class _NestedCheckboxEditorState extends ConsumerState<NestedCheckboxEditor> {
  void _edit() {
    //
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          //
          return CheckboxForm(
            fieldLabel: widget.fieldLabel,
            options: widget.options,
            oldValue: widget.oldValue,
            onSubmit: widget.onSubmit,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(widget.fieldLabel),
        subtitle: widget.oldValue.isEmpty
            ? const Text('NO ITEM(S) SELECTED')
            : Text(widget.oldValue.map((e) => e.label).join(', ')),
        onTap: () => _edit(),
        trailing: EditButton(
          onPressed: widget.enabled ? () => _edit() : null,
          enabled: widget.enabled,
        ),
        enabled: widget.enabled,
      ),
    );
  }
}

class CheckboxForm extends ConsumerStatefulWidget {
  const CheckboxForm({
    super.key,
    required this.fieldLabel,
    required this.oldValue,
    required this.options,
    required this.onSubmit,
  });

  final String fieldLabel;
  final List<Option> oldValue;
  final List<Option> options;
  final Function(List<Option> newValue) onSubmit;

  @override
  ConsumerState<CheckboxForm> createState() => _CheckboxFormState();
}

class _CheckboxFormState extends ConsumerState<CheckboxForm> {
  late List<Option> oldValue;
  late List<Option> newValue;

  @override
  void initState() {
    super.initState();

    // set initial state
    oldValue = widget.oldValue;

    // make modifiable
    newValue = oldValue.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fieldLabel),
        actions: [
          //
          FilledButton(
            onPressed: const DeepCollectionEquality().equals(oldValue, newValue)
                ? null
                : () {
                    widget.onSubmit(newValue);
                  },
            child: ref.watch(patchProjectControllerProvider).isLoading
                ? const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(),
                  )
                : const Text('UPDATE'),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            final option = widget.options[index];

            return CheckboxListTile.adaptive(
              value: newValue.contains(option),
              activeColor: Theme.of(context).primaryColor,
              onChanged: (bool? value) {
                setState(() {
                  if (value ?? false) {
                    newValue.add(option);
                  } else {
                    newValue.remove(option);
                  }
                });
              },
              title: Text(
                option.label,
              ),
            );
          }),
    );
  }
}
