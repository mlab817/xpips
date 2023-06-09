import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/extensions.dart';
import '../../../../application/providers/numberformatter_provider.dart';
import '../../../../presentation/controllers/controllers.dart';
import '../../../../presentation/controllers/patchproject_controller.dart';
import '../../../../domain/models/fullproject.dart';

class TotalProjectCost extends ConsumerStatefulWidget {
  const TotalProjectCost({super.key, required this.project});

  final FullProject project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTitle();
}

class _UpdateTitle extends ConsumerState<TotalProjectCost> {
  void _edit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UpdateDescriptionForm(project: widget.project);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
          "PHP ${ref.watch(numberFormatterProvider).format(widget.project.totalCost)}"),
      title: const Text('Total Cost in absolute PHP'),
      trailing: IconButton(
        onPressed: () => _edit(),
        icon: const Icon(
          Icons.edit,
        ),
      ),
      onTap: () async {
        await Clipboard.setData(
                ClipboardData(text: widget.project.totalCost.toString()))
            .then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cost copied to clipboard")));
        });
      },
    );
  }
}

class UpdateDescriptionForm extends ConsumerStatefulWidget {
  const UpdateDescriptionForm({super.key, required this.project});

  final FullProject project;

  @override
  ConsumerState<UpdateDescriptionForm> createState() => _UpdateTitleFormState();
}

class _UpdateTitleFormState extends ConsumerState<UpdateDescriptionForm> {
  String? oldValue;
  String? newValue;

  @override
  Widget build(BuildContext context) {
    if (oldValue == null) {
      oldValue = widget.project.totalCost.toString();
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
        title: const Text('Total Cost in absolute PHP'),
        actions: [
          FilledButton(
            // disable if no changes have been made
            onPressed: oldValue == newValue
                ? null
                : () {
                    final Map<String, dynamic> payload = {
                      'total_cost': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: widget.project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(widget.project.uuid)
                            .notifier)
                        .update(totalCost: double.tryParse(newValue ?? ''));

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
                  decoration: const InputDecoration(prefixText: 'PHP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
