import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/common/editbutton.dart';

import '../../../../domain/models/fullproject.dart';
import '../../../../domain/models/option.dart';
import '../../../controllers/patchproject_controller.dart';

class CheckboxEditor extends ConsumerStatefulWidget {
  const CheckboxEditor({
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
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckboxEditorState();
}

class _CheckboxEditorState extends ConsumerState<CheckboxEditor> {
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
            : _buildList(widget
                .oldValue), // Text(widget.oldValue.map((e) => e.label).join(', ')),
        onTap: () => _edit(),
        trailing: widget.project.readonly
            ? null
            : EditButton(
                onPressed: widget.enabled ? () => _edit() : null,
              ),
        enabled: widget.enabled,
      ),
    );
  }

  Widget _buildList(List<Option> selected) {
    return Wrap(
      children: selected
          .map((e) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  label: Text(e.label),
                  visualDensity: VisualDensity.compact,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ))
          .toList(),
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
              value: newValue
                  .where((element) => option.value == element.value)
                  .isNotEmpty,
              subtitle:
                  option.description != null ? Text(option.description!) : null,
              activeColor: Theme.of(context).primaryColor,
              controlAffinity: ListTileControlAffinity.leading,
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
