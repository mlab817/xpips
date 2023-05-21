import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/office.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/offices_controller.dart';
import '../empty_indicator.dart';
import '../success_indicator.dart';

class UpdateOffice extends ConsumerWidget {
  const UpdateOffice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('rebuilding updateOffice');

    final office = ref
        .watch(fullProjectControllerProvider.select((value) => value.office));

    return ListTile(
      title: const Text('Office'),
      subtitle:
      office != null ? Text(office.acronym) : const Text('Select one'),
      trailing:
      office != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: () {
        _selectOffice(context, ref);
      },
    );
  }

  Future<void> _selectOffice(context, ref) async {
    final office = ref
        .watch(fullProjectControllerProvider.select((value) => value.office));
    final officesAsync = ref.watch(officesProvider);

    final Office? response = await showDialog(
        context: context,
        builder: (BuildContext context) {
          Office? selected = office;

          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Office'),
            content: officesAsync.when(
              data: (data) {
                final offices = data.data;
                return SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: offices.length,
                    itemBuilder: (context, index) {
                      return RadioListTile<Office>(
                        value: offices[index],
                        groupValue: selected,
                        title: Text(offices[index].acronym),
                        onChanged: (Office? value) {
                          selected = value;
                        },
                      );
                    },
                  ),
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
        });

    ref.read(fullProjectControllerProvider.notifier).update(office: response);
  }
}
