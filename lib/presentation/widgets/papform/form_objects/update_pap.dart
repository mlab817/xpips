import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import '../../../controllers/controllers.dart';
import '../../../controllers/patchproject_controller.dart';
import '../select_dialog_content.dart';

class UpdatePap extends ConsumerWidget {
  const UpdatePap({Key? key, required this.project}) : super(key: key);

  final FullProject project;

  Future<void> _selectType(BuildContext context, WidgetRef ref) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return _UpdateForm(project: project);
    }));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: const Text('Program or Project'),
      subtitle: project.type != null
          ? Text(project.type!.label)
          : const Text('Select one'),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          _selectType(context, ref);
        },
      ),
      onTap: () {
        _selectType(context, ref);
      },
    );
  }
}

class _UpdateForm extends ConsumerStatefulWidget {
  const _UpdateForm({super.key, required this.project});

  final FullProject project;

  @override
  ConsumerState<_UpdateForm> createState() => __UpdateFormState();
}

class __UpdateFormState extends ConsumerState<_UpdateForm> {
  Option? oldValue;
  Option? newValue;

  @override
  void initState() {
    super.initState();
    oldValue = widget.project.type;
    newValue = oldValue;
  }

  @override
  Widget build(BuildContext context) {
    final optionsAsync = ref.watch(optionsControllerProvider);

    print("oldValue: $oldValue");
    print("newValue: $newValue");
    print(oldValue == newValue);

    return Scaffold(
      appBar: AppBar(actions: [
        FilledButton(
          onPressed: oldValue == newValue
              ? null
              : () {
                  ref
                      .watch(patchProjectControllerProvider.notifier)
                      .submit(uuid: widget.project.uuid ?? '', payload: {
                    'type_id': newValue?.value,
                  });

                  ref
                      .read(fullProjectControllerProvider(widget.project.uuid)
                          .notifier)
                      .update(type: newValue);

                  Navigator.pop(context);
                },
          child: const Text('Update'),
        ),
      ], title: const Text('Program or Project')),
      body: optionsAsync.when(
        data: (data) {
          return SelectDialogContent(
            options: data.data.types ?? [],
            multiple: false,
            selected: newValue,
            onChanged: (value) {
              print(value);
              setState(() {
                newValue = value;
              });
            },
          );
        },
        error: (err, stackTrace) {
          return Center(
            child: Text(err.toString()),
          );
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
