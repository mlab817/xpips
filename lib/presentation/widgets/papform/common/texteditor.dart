import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/extensions.dart';
import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/models/fullproject.dart';

class TextEditor extends ConsumerStatefulWidget {
  const TextEditor({
    super.key,
    required this.project,
    required this.fieldLabel,
    required this.oldValue,
    required this.onSubmit,
  });

  final FullProject project;
  final String fieldLabel;
  final String oldValue;
  final Function(String newValue) onSubmit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextEditor();
}

class _TextEditor extends ConsumerState<TextEditor> {
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
      subtitle: Text(widget.oldValue),
      title: Text(widget.fieldLabel),
      trailing: IconButton(
        onPressed: () => _edit(),
        icon: const Icon(
          Icons.edit,
        ),
      ),
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: widget.oldValue)).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${widget.fieldLabel} copied to clipboard")));
        });
      },
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
  final String oldValue;
  final String fieldLabel;
  final Function(String newValue) onSubmit;

  @override
  ConsumerState<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends ConsumerState<UpdateForm> {
  String? oldValue;
  String newValue = '';

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
                child: TextFormField(
                  autofocus: true,
                  initialValue: oldValue,
                  onChanged: (String value) {
                    print("typing $value");
                    setState(() {
                      newValue = value;
                    });
                    print("oldValue $oldValue");
                    print("newValue $newValue");
                    print(oldValue == newValue);
                  },
                  decoration: InputDecoration(
                    label: Text(widget.fieldLabel),
                  ),
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
