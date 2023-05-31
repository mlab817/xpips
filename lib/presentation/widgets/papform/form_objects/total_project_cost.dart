import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../success_indicator.dart';

class TotalProjectCost extends ConsumerStatefulWidget {
  const TotalProjectCost({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  ConsumerState<TotalProjectCost> createState() => _TotalProjectCostState();
}

class _TotalProjectCostState extends ConsumerState<TotalProjectCost> {
  final FocusNode totalCostNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final totalCost = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.totalCost));

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
              .read(fullProjectControllerProvider(widget.uuid).notifier)
              .update(totalCost: double.tryParse(value));
        },
      ),
      onTap: () {
        totalCostNode.requestFocus();
      },
    );
  }
}
