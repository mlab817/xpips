import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/models.dart';
import '../controllers/controllers.dart';

class SignupBottomSheet extends ConsumerWidget {
  const SignupBottomSheet({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final Function(Office? office) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offices = ref.watch(filteredOfficesProvider);

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: TextField(
          onChanged: (String value) {
            ref.read(officeFilterProvider.notifier).state = value;
          },
        ),
      ),
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: offices.length,
          itemBuilder: (context, index) {
            final office = offices[index];

            return ListTile(
              title: Text(office.acronym),
              subtitle: Text(office.name),
              onTap: () {
                // handleTap
                onSelect(office);
              },
            );
          },
        ),
      ),
    ]);
  }
}
