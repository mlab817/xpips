import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/fullproject_controller.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../success_indicator.dart';

class TotalProjectCost extends ConsumerWidget {
  const TotalProjectCost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCost = ref.watch(
        fullProjectControllerProvider.select((state) => state.totalCost));

    final FocusNode totalCostNode = FocusNode();

    return ListTile(
      title: const Text('Total Project Cost in absolute PHP'),
      trailing:
          totalCost != null ? const SuccessIndicator() : const EmptyIndicator(),
      subtitle: TextFormField(
        focusNode: totalCostNode,
        initialValue: totalCost?.toString() ?? '',
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: getTextInputDecoration(hintText: 'Total Project Cost'),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(totalCost: double.tryParse(value));
        },
      ),
      onTap: () {
        totalCostNode.requestFocus();
      },
    );
  }
}
