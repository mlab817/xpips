import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/extensions.dart';
import '../../../../application/providers/numberformatter_provider.dart';
import '../../../controllers/controllers.dart';
import '../cost_field.dart';

class UpdateRegionalCost extends ConsumerStatefulWidget {
  const UpdateRegionalCost({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _UpdateRegionalCostState();
}

class _UpdateRegionalCostState extends ConsumerState<UpdateRegionalCost> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          dataRowMinHeight: 40,
          dataRowMaxHeight: 40,
          columnSpacing: 1,
          border: TableBorder.all(
            color: Colors.grey,
            width: 0.5,
            borderRadius: BorderRadius.circular(16),
          ),
          columns: _buildColumns(context),
          rows: [..._buildRows(context, ref), _buildTotalRow(context, ref)],
          // total ROW
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns(BuildContext context) {
    final windowWidth =
        MediaQuery.of(context).size.width - 128; // remove horizontal margins
    final columnWidth = windowWidth / 10;

    return <DataColumn>[
      DataColumn(
        label: SizedBox(
          width: windowWidth / 10,
          child: const Text(
            'REGION',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      ...List.generate(8, (index) {
        final year = 2022 + index;

        return DataColumn(
          label: SizedBox(
            width: columnWidth,
            child: Center(
              child: Text(
                "$year",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              'TOTAL',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ];
  }

  List<DataRow> _buildRows(BuildContext context, WidgetRef ref) {
    final project = ref.watch(fullProjectControllerProvider);

    final columnWidth = (MediaQuery.of(context).size.width - 128) / 10;

    // check if there are already existing regions
    final regions = project.regions;

    return regions.map((regionalInvestment) {
      final label = regionalInvestment.region?.label ?? 'REGION';

      return DataRow(
        cells: [
          DataCell(
            SizedBox(
              width: columnWidth,
              child: Text(label),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2022.toString(),
                onChanged: (String value) {
                  //
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2022: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2023.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2023: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2024.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2024: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2025.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2025: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2026.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2026: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2027.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2027: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2028.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2028: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: regionalInvestment.y2029.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.regions];
                  final index = updatedInvestments.indexOf(regionalInvestment);
                  final updatedRegionalInvestment = regionalInvestment.copyWith(
                    y2029: double.parse(value),
                  );
                  updatedInvestments[index] = updatedRegionalInvestment;

                  ref.read(fullProjectControllerProvider.notifier).update(
                        regions: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: Text(
                ref
                    .watch(numberFormatterProvider)
                    .format(regionalInvestment.total),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  DataRow _buildTotalRow(BuildContext context, WidgetRef ref) {
    final columnWidth = (MediaQuery.of(context).size.width - 128) / 10;
    return DataRow(cells: [
      const DataCell(Text('GRAND TOTAL')),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2022),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2023),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2024),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2025),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2026),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2027),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2028),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .y2029),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider)
                .regionalInvestmentTotalRow
                .grandTotal),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    ]);
  }
}
