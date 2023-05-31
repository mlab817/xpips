import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';
import 'package:pips/presentation/widgets/papform/update_button.dart';

import '../../../../domain/models/models.dart';
import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdateInfraSectors extends ConsumerWidget {
  const UpdateInfraSectors({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infrastructureSectors = ref
        .watch(fullProjectControllerProvider(uuid)
            .select((value) => value.infrastructureSectors))
        .toList();
    final trip = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.trip));

    return ListTile(
      enabled: trip ?? false,
      title: const Text('Main Infrastructure Sector/Subsector'),
      trailing: infrastructureSectors.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      subtitle: infrastructureSectors.isNotEmpty
          ? Text(
              infrastructureSectors.map((element) => element.label).join(', '))
          : const Text('Select as many as applicable'),
      onTap: () {
        _selectInfraSectors(context, ref);
      },
    );
  }

  Future<void> _selectInfraSectors(BuildContext context, WidgetRef ref) async {
    final infrastructureSectors = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.infrastructureSectors));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option>? selected = infrastructureSectors;

          return AlertDialog(
            title: const Text('Main Infrastructure Sector/Subsector'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.infrastructureSectors ?? [],
                    multiple: true,
                    selected: selected,
                    onChanged: (value) {
                      // selected = value;
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(error.toString()),
                  );
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              CancelButton(onPressed: () {
                Navigator.pop(context);
              }),
              UpdateButton(onPressed: () {
                Navigator.pop(context, selected);
              })
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(infrastructureSectors: response);
  }
}
