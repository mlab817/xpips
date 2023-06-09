import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/extensions.dart';
import '../../../../presentation/controllers/controllers.dart';
import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/models/fullproject.dart';

class UpdateTitle extends ConsumerStatefulWidget {
  const UpdateTitle({super.key, required this.project});

  final FullProject project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTitle();
}

class _UpdateTitle extends ConsumerState<UpdateTitle> {
  void _editTitle() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UpdateTitleForm(project: widget.project);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(widget.project.title ?? 'N/A'),
      title: const Text('Title'),
      trailing: IconButton(
        onPressed: () => _editTitle(),
        icon: const Icon(
          Icons.edit,
        ),
      ),
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: widget.project.title ?? ''))
            .then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Title copied to clipboard")));
        });
      },
    );
  }
}

class UpdateTitleForm extends ConsumerStatefulWidget {
  const UpdateTitleForm({super.key, required this.project});

  final FullProject project;

  @override
  ConsumerState<UpdateTitleForm> createState() => _UpdateTitleFormState();
}

class _UpdateTitleFormState extends ConsumerState<UpdateTitleForm> {
  String? oldValue;
  String? newValue;

  @override
  Widget build(BuildContext context) {
    if (oldValue == null) {
      oldValue = widget.project.title;
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
        title: const Text('Title'),
        actions: [
          FilledButton(
            // disable if no changes have been made
            onPressed: oldValue == newValue
                ? null
                : () {
                    final Map<String, dynamic> payload = {
                      'title': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: widget.project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(widget.project.uuid)
                            .notifier)
                        .update(title: newValue);

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
                    label: Text('PAP Title'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
