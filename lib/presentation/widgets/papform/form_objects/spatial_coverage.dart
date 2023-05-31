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

class SpatialCoverage extends ConsumerWidget {
  const SpatialCoverage({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spatialCoverage = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.spatialCoverage));

    return ListTile(
      title: const Text('Spatial Coverage'),
      subtitle: spatialCoverage != null
          ? Text(spatialCoverage.label)
          : const Text('Select one'),
      trailing: spatialCoverage != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        _selectSpatialCoverage(context, ref);
      },
    );
  }

  Future<void> _selectSpatialCoverage(
      BuildContext context, WidgetRef ref) async {
    final spatialCoverage = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.spatialCoverage));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = spatialCoverage;

          return AlertDialog(
            title: const Text('Spatial Coverage'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.spatialCoverages ?? [],
                    multiple: false,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stacktrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
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
        .update(spatialCoverage: response);
  }
}
