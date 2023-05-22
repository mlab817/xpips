import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/controllers.dart';
import '../get_input_decoration.dart';

class UpdateRap extends ConsumerWidget {
  const UpdateRap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildRap(ref),
        _buildRapCost(context, ref),
      ],
    );
  }

  Widget _buildRap(ref) {
    final hasRap = ref
        .watch(fullProjectControllerProvider.select((state) => state.hasRap));
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));

    return SwitchListTile(
      title: const Text('With Resettlement Component?'),
      value: hasRap ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(hasRap: value);
            }
          : null,
    );
  }

  // CIP only
  Widget _buildRapCost(context, ref) {
    final windowWidth = MediaQuery.of(context).size.width - 128;
    final columnWidth = windowWidth / 6;

    final columns = List.generate(6, (index) {
      return DataColumn(
          label: SizedBox(
              width: columnWidth,
              child: Center(child: Text("FY ${2023 + index}"))));
    });

    final rows = [
      DataRow(
        cells: List.generate(
          6,
          (index) {
            return DataCell(SizedBox(
              width: columnWidth,
              child: TextField(
                key: ValueKey("rap_$index"),
                decoration: getTextInputDecoration(),
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.center,
                expands: false,
              ),
            ));
          },
        ),
      ),
    ];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          dataRowMinHeight: 60,
          dataRowMaxHeight: 60,
          columnSpacing: 1,
          border: TableBorder.all(
            color: Colors.grey,
            width: 0.5,
            borderRadius: BorderRadius.circular(16),
          ),
          columns: columns,
          rows: rows,
        ),
      ),
    );
  }

  Widget _buildRapAffectedHouseholds() {
    return ListTile(
      title: const Text('Affected Households'),
      subtitle: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        // TODO: initial value and onChanged
        decoration: getTextInputDecoration(),
      ),
    );
  }
}
