import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/extensions.dart';
import '../../../../presentation/controllers/controllers.dart';
import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/models/fullproject.dart';

class UpdateNotes extends ConsumerStatefulWidget {
  const UpdateNotes({super.key, required this.project});

  final FullProject project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateNotes();
}

class _UpdateNotes extends ConsumerState<UpdateNotes> {
  void _edit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UpdateForm(project: widget.project);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(widget.project.notes ?? 'N/A'),
      title: const Text('Notes'),
      trailing: IconButton(
        onPressed: () => _edit(),
        icon: const Icon(
          Icons.edit,
        ),
      ),
      onTap: () async {
        await Clipboard.setData(
                ClipboardData(text: widget.project.expectedOutputs ?? ''))
            .then((_) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Notes")));
        });
      },
    );
  }
}

class UpdateForm extends ConsumerStatefulWidget {
  const UpdateForm({super.key, required this.project});

  final FullProject project;

  @override
  ConsumerState<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends ConsumerState<UpdateForm> {
  String? oldValue;
  String? newValue;

  @override
  Widget build(BuildContext context) {
    if (oldValue == null) {
      oldValue = widget.project.notes;
      newValue = oldValue;
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
        title: const Text('Notes'),
        actions: [
          FilledButton(
            // disable if no changes have been made
            onPressed: oldValue == newValue
                ? null
                : () {
                    final Map<String, dynamic> payload = {
                      'notes': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: widget.project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(widget.project.uuid)
                            .notifier)
                        .update(notes: newValue);

                    // close
                    Navigator.pop(context);
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
                  decoration: const InputDecoration(
                    label: Text('Notes'),
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