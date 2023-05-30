import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import '../../../controllers/controllers.dart';
import '../../papform_screen.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdateInfraSectors extends ConsumerStatefulWidget {
  const UpdateInfraSectors({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _UpdateInfraSectorsState();
}

class _UpdateInfraSectorsState extends ConsumerState<UpdateInfraSectors> {
  @override
  Widget build(BuildContext context) {
    return _buildInfraSectors();
  }

  Widget _buildInfraSectors() {
    final infrastructureSectors = ref.watch(fullProjectControllerProvider
        .select((value) => value.infrastructureSectors));
    final trip =
        ref.watch(fullProjectControllerProvider.select((value) => value.trip));

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
      onTap: _selectInfraSectors,
    );
  }

  Future<void> _selectInfraSectors() async {
    final infrastructureSectors = ref.watch(fullProjectControllerProvider
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
                      selected = value;
                    },
                  );
                },
                error: (error, stackTrace) => Container(),
                loading: () => const CircularProgressIndicator()),
            actions: [
              buildCancel(context),
              buildUpdate(context, () {
                Navigator.pop(context, selected);
              })
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(infrastructureSectors: response);
  }
}
