import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../success_indicator.dart';

class UpdateOffice extends ConsumerWidget {
  const UpdateOffice({
    Key? key,
    this.uuid,
  }) : super(key: key);

  final String? uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final office = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.office));

    return ListTile(
      title: const Text('Office (Encoder)'),
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
    final office = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.office));
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

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(office: response);
  }
}
