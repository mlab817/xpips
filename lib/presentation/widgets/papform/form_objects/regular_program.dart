import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/fullproject_controller.dart';

class RegularProgram extends ConsumerWidget {
  const RegularProgram({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: ref.watch(fullProjectControllerProvider(uuid)).regularProgram ??
          false,
      onChanged: ref.watch(fullProjectControllerProvider(uuid)).type?.value == 1
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider(uuid).notifier)
                  .update(regularProgram: value);
            }
          : null,
      title: const Text('Regular Program'),
      subtitle: const Text(
        'A regular program refers to a program being implemented by the agencies on a continuing basis.',
      ),
    );
  }
}
