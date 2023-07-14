import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';
import 'package:pips/presentation/widgets/papform/common/editbutton.dart';

import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/entities/models.dart';

class DateEditor extends ConsumerStatefulWidget {
  const DateEditor({
    super.key,
    required this.project,
    required this.fieldLabel,
    required this.oldValue,
    required this.onSubmit,
    this.enabled = true,
  });

  final FullProject project;
  final String fieldLabel;
  final DateTime? oldValue;
  final Function(DateTime newValue) onSubmit;
  final bool enabled;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RadioEditor();
}

class _RadioEditor extends ConsumerState<DateEditor> {
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
        subtitle: Row(
          children: [
            Chip(
              label: widget.oldValue != null
                  ? Text(
                      ref.watch(dateFormatterProvider).format(widget.oldValue!))
                  : const Text('NONE'),
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
                enabled: widget.enabled,
              ),
        enabled: widget.enabled,
        onTap: () => _edit(),
      ),
    );
  }
}

class UpdateForm<T> extends ConsumerStatefulWidget {
  const UpdateForm({
    super.key,
    required this.project,
    required this.oldValue,
    required this.fieldLabel,
    required this.onSubmit,
  });

  final FullProject project;
  final DateTime? oldValue;
  final String fieldLabel;
  final Function(DateTime newValue) onSubmit;

  @override
  ConsumerState<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends ConsumerState<UpdateForm> {
  late DateTime? oldValue;
  late DateTime? newValue;

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    oldValue = widget.oldValue;
    newValue = oldValue;

    if (newValue != null) {
      dateController.text = ref.watch(dateFormatterProvider).format(newValue!);
    }
  }

  @override
  void dispose() {
    dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: TextFormField(
            controller: dateController,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today), //icon of text field
              labelText: "Enter Date", //label text of field
            ),
            readOnly: true, // when true user cannot edit text
            onTap: () async {
              //when click we have to show the datepicker
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate:
                    widget.oldValue ?? DateTime.now(), //get today's date
                firstDate: DateTime(
                    2020), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime.now(),
                initialEntryMode: DatePickerEntryMode.input,
              );

              setState(() {
                newValue = pickedDate;
                if (pickedDate != null) {
                  dateController.text =
                      ref.watch(dateFormatterProvider).format(pickedDate);
                }
              });
            }),
      ),
    );
  }
}
