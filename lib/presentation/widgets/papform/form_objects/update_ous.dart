import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdateOus extends ConsumerWidget {
  const UpdateOus({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final operatingUnits = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.operatingUnits));

    return ListTile(
      title: const Text('Operating Units'),
      subtitle: operatingUnits.isNotEmpty
          ? Text(operatingUnits.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: operatingUnits.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () => _selectOus(context, ref),
    );
  }

  Future<void> _selectOus(BuildContext context, WidgetRef ref) async {
    final operatingUnits = ref
        .watch(fullProjectControllerProvider(uuid)
            .select((value) => value.operatingUnits))
        .toList();
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option> selected = operatingUnits;

          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Operating Units'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.operatingUnits ?? [],
                    multiple: true,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (err, stackTrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(context),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(operatingUnits: response);
  }

  Widget _buildCancel(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'),
    );
  }

  Widget _buildUpdate({required Function onUpdate}) {
    return FilledButton(
      onPressed: () {
        onUpdate();
      },
      child: const Text('Update'),
    );
  }
}
