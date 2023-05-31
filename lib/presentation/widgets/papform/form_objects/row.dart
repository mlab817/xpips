import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/controllers.dart';
import '../get_input_decoration.dart';

class UpdateRow extends ConsumerWidget {
  const UpdateRow({Key? key, this.uuid}) : super(key: key);

  final String? uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildRow(ref),
        _buildRowCost(context, ref),
        _buildRowAffectedHouseholds(ref),
      ],
    );
  }

  // CIP only
  Widget _buildRow(ref) {
    final hasRow = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.hasRow));
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cip));

    return SwitchListTile(
      title: const Text('With Right of Way Component?'),
      value: hasRow ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider(uuid).notifier)
                  .update(hasRow: value);
            }
          : null,
    );
  }

  // CIP only
  Widget _buildRowCost(context, ref) {
    final windowWidth = MediaQuery.of(context).size.width - 128;
    final columnWidth = windowWidth / 6;

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
          columns: List.generate(6, (index) {
            return DataColumn(
              label: SizedBox(
                width: columnWidth,
                child: Center(
                  child: Text("FY ${2023 + index}"),
                ),
              ),
            );
          }),
          rows: [
            DataRow(
              cells: List.generate(
                6,
                (index) {
                  return DataCell(SizedBox(
                    width: columnWidth,
                    child: TextField(
                      key: ValueKey("row_$index"),
                      decoration: getTextInputDecoration(),
                      textAlign: TextAlign.right,
                      textAlignVertical: TextAlignVertical.center,
                      expands: false,
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowAffectedHouseholds(ref) {
    final rowAffectedHouseholds = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.rowAffectedHouseholds));

    return ListTile(
      title: const Text('Affected Households'),
      subtitle: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        // TODO: initial value and onChanged
        initialValue: rowAffectedHouseholds.toString(),
        decoration: getTextInputDecoration(),
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider(uuid).notifier)
              .update(rowAffectedHouseholds: int.tryParse(value));
        },
      ),
    );
  }
}
