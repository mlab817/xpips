import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/controllers/options_controller.dart';
import 'package:pips/presentation/controllers/project_controller.dart';

import '../../../../domain/models/option.dart';
import '../../../screens/papform_screen.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdatePap extends ConsumerWidget {
  const UpdatePap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(fullProjectControllerProvider);

    return ListTile(
      title: const Text('Program or Project'),
      subtitle: project.type != null
          ? Text(project.type!.label)
          : const Text('Select one'),
      trailing: project.type != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () => _selectPap(context, ref),
    );
  }

  Future<void> _selectPap(context, ref) async {
    final project = ref.watch(fullProjectControllerProvider);
    final optionsAsync = ref.watch(optionsControllerProvider);
    //
    Option? response = await showDialog<Option>(
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
              error: (err, stack) => Container(),
              loading: () => const CircularProgressIndicator(),
            ),
            actions: [
              buildCancel(context),
              buildUpdate(context, () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref.read(fullProjectControllerProvider.notifier).update(type: response);

    // TODO: implement the autofill for program/project
    //   if (response != null) {
    //     setState(() {
    //       _project = _project.copyWith(type: response);
    //     });
    //
    //     // if program, set funding source to ng-local
    //     if (response.value == 1) {
    //       setState(() {
    //         _project = _project.copyWith(
    //           fundingSource: _options?.fundingSources?.first, // ng-local
    //           implementationMode:
    //               _options?.implementationModes?.first, // local procurement
    //           // implementation period for programs is 2023 to 2028
    //           startYear: _options?.years
    //               ?.where((element) => int.parse(element.label) == 2023)
    //               .first, // Option(value: 24, label: '2023'),
    //           endYear: _options?.years
    //               ?.where((element) => int.parse(element.label) == 2028)
    //               .first, // Option(value: 29, label: '2028'),
    //         );
    //       });
    //     }
    //   }
    // }
  }
}
