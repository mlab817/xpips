import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class ImplementationBasis extends ConsumerWidget {
  const ImplementationBasis({Key? key}) : super(key: key);

  Future<void> _selectBases(BuildContext context, WidgetRef ref) async {
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (context) {
        List<Option> selected =
            ref.watch(fullProjectControllerProvider).bases.toList();

        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Basis for Implementation'),
          content: optionsAsync.when(
            data: (data) {
              return SelectDialogContent(
                options: data.data.bases ?? [],
                multiple: true,
                selected: selected,
                onChanged: (value) {
                  selected = value;
                },
              );
            },
            error: (err, stackTrace) {
              return Center(
                child: Text(
                  err.toString(),
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () {
                  Navigator.pop(context, selected);
                },
                child: const Text('Update')),
          ],
        );
      },
    );

    ref.read(fullProjectControllerProvider.notifier).update(bases: response);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bases =
        ref.watch(fullProjectControllerProvider.select((value) => value.bases));

    return ListTile(
        title: const Text('Basis for Implementation'),
        subtitle: bases.isNotEmpty
            ? Text(bases.map((e) => e.label).join(', '))
            : const Text(
                'Select as many as applicable',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
        trailing: bases.isNotEmpty
            ? const SuccessIndicator()
            : const EmptyIndicator(),
        onTap: () {
          _selectBases(context, ref);
        });
  }
}
