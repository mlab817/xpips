import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';
import 'package:pips/presentation/widgets/papform/update_button.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdateLocations extends ConsumerWidget {
  const UpdateLocations({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.locations));

    return ListTile(
      title: const Text('Regions/Provinces'),
      subtitle: locations.isNotEmpty
          ? Text(locations.map((location) => location.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: locations.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        _selectLocations(context, ref);
      },
    );
  }

  Future<void> _selectLocations(BuildContext context, WidgetRef ref) async {
    final locations = ref
        .watch(fullProjectControllerProvider(uuid)
            .select((value) => value.locations))
        .toList();
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option>? selected = locations;

          return AlertDialog(
            title: const Text('Regions/Provinces'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.locations ?? [],
                  selected: selected,
                  multiple: true,
                  onChanged: (value) {
                    selected = value;
                  },
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => const CircularProgressIndicator(),
            ),
            actions: [
              CancelButton(onPressed: () {
                Navigator.pop(context);
              }),
              UpdateButton(onPressed: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(locations: response);
  }
}
