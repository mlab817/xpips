import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/option.dart';
import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/models/fullproject.dart';
import 'editbutton.dart';

class RadioEditor extends ConsumerStatefulWidget {
  const RadioEditor({
    super.key,
    required this.project,
    required this.fieldLabel,
    required this.oldValue,
    required this.onSubmit,
    required this.options,
    this.enabled = true,
  });

  final FullProject project;
  final String fieldLabel;
  final Option? oldValue;
  final List<Option> options;
  final Function(Option newValue) onSubmit;
  final bool enabled;

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
        options: widget.options,
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
        subtitle: Row(
          children: [
            Chip(
              label: Text(widget.oldValue?.label ?? 'NONE'),
              visualDensity: VisualDensity.compact,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ],
        ),
        title: Text(widget.fieldLabel),
        trailing: widget.project.readonly
            ? null
            : EditButton(
                onPressed: widget.enabled ? () => _edit() : null,
              ),
        onTap: widget.project.readonly ? null : () => _edit(),
        enabled: widget.enabled,
      ),
    );
  }
}

class UpdateForm<T> extends ConsumerStatefulWidget {
  const UpdateForm({
    super.key,
    required this.project,
    required this.oldValue,
    required this.options,
    required this.fieldLabel,
    required this.onSubmit,
  });

  final FullProject project;
  final Option? oldValue;
  final List<Option> options;
  final String fieldLabel;
  final Function(Option newValue) onSubmit;

  @override
  ConsumerState<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends ConsumerState<UpdateForm> {
  late Option? oldValue;
  late Option? newValue;

  @override
  void initState() {
    super.initState();

    oldValue = widget.oldValue;
    newValue = oldValue;
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.options;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fieldLabel),
        actions: [
          FilledButton(
            // disable if no changes have been made
            onPressed: oldValue == newValue
                ? null
                : (newValue != null
                    ? () {
                        widget.onSubmit(newValue!);
                      }
                    : null),
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
        child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              return RadioListTile.adaptive(
                value: options[index].value,
                groupValue: newValue?.value,
                title: Text(options[index].label),
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  //
                  setState(() {
                    newValue = options[index];
                  });
                },
              );
            }),
      ),
    );
  }
}
