import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/project_controller.dart';
import '../cost_field.dart';

class UpdateFsCost extends ConsumerStatefulWidget {
  const UpdateFsCost({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _UpdateFsCostState();
}

class _UpdateFsCostState extends ConsumerState<UpdateFsCost> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final windowWidth = width - 128;
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
          columns: _buildColumns(columnWidth),
          rows: _buildRows(columnWidth),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns(double columnWidth) {
    return List.generate(6, (index) {
      return DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: Center(
            child: Text("FY ${2023 + index}"),
          ),
        ),
      );
    });
  }

  List<DataRow> _buildRows(double columnWidth) {
    final fsCost = ref
        .watch(fullProjectControllerProvider.select((value) => value.fsCost));

    return [
      DataRow(
        cells: [
          DataCell(SizedBox(
            width: columnWidth,
            child: CostField(
              value: fsCost?.y2023?.toString(),
              onChanged: (String value) {
                ref.read(fullProjectControllerProvider.notifier).update(
                    fsCost: fsCost?.copyWith(y2023: num.tryParse(value)));
              },
            ),
          )),
          DataCell(SizedBox(
            width: columnWidth,
            child: CostField(
              value: fsCost?.y2024?.toString(),
              onChanged: (String value) {
                ref.read(fullProjectControllerProvider.notifier).update(
                    fsCost: fsCost?.copyWith(y2024: num.tryParse(value)));
              },
            ),
          )),
          DataCell(SizedBox(
            width: columnWidth,
            child: CostField(
              value: fsCost?.y2025?.toString(),
              onChanged: (String value) {
                ref.read(fullProjectControllerProvider.notifier).update(
                    fsCost: fsCost?.copyWith(y2025: num.tryParse(value)));
              },
            ),
          )),
          DataCell(SizedBox(
            width: columnWidth,
            child: CostField(
              value: fsCost?.y2026?.toString(),
              onChanged: (String value) {
                ref.read(fullProjectControllerProvider.notifier).update(
                    fsCost: fsCost?.copyWith(y2026: num.tryParse(value)));
              },
            ),
          )),
          DataCell(SizedBox(
            width: columnWidth,
            child: CostField(
              value: fsCost?.y2027?.toString(),
              onChanged: (String value) {
                ref.read(fullProjectControllerProvider.notifier).update(
                    fsCost: fsCost?.copyWith(y2027: num.tryParse(value)));
              },
            ),
          )),
          DataCell(SizedBox(
            width: columnWidth,
            child: CostField(
              value: fsCost?.y2028?.toString(),
              onChanged: (String value) {
                ref.read(fullProjectControllerProvider.notifier).update(
                    fsCost: fsCost?.copyWith(y2028: num.tryParse(value)));
              },
            ),
          )),
        ],
      ),
    ];
  }
}
