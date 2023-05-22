import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdatePap extends ConsumerWidget {
  const UpdatePap({Key? key}) : super(key: key);

  Future<void> _selectType(BuildContext context, WidgetRef ref) async {
    final project = ref.watch(fullProjectControllerProvider);
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (context) {
        Option? selected = project.type;

        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Program or Project'),
          content: optionsAsync.when(
            data: (data) {
              return SelectDialogContent(
                options: data.data.types ?? [],
                multiple: false,
                selected: selected,
                onChanged: (value) {
                  selected = value;
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
              child: const Text('Update'),
            ),
          ],
        );
      },
    );

    ref.read(fullProjectControllerProvider.notifier).update(type: response);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type =
        ref.watch(fullProjectControllerProvider.select((value) => value.type));

    return ListTile(
        title: const Text('Program or Project'),
        subtitle: type != null ? Text(type.label) : const Text('Select one'),
        trailing:
            type != null ? const SuccessIndicator() : const EmptyIndicator(),
        onTap: () {
          _selectType(context, ref);
        });
  }
}
