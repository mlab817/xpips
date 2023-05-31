import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/numberformatter_provider.dart';

import '../../../controllers/controllers.dart';
import '../cost_field.dart';

// TODO: update setting value

class UpdateFinancialAccomplishment extends ConsumerWidget {
  const UpdateFinancialAccomplishment({
    Key? key,
    this.uuid,
  }) : super(key: key);

  final String? uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final windowWidth = width - 128;
    final columnWidth = windowWidth / 4;
    final project = ref.watch(fullProjectControllerProvider(uuid));

    final columns = <DataColumn>[
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text('Year'),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text('NEP'),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text('GAA'),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text('Disbursement'),
          ),
        ),
      ),
    ];

    final rows = [
      DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(width: columnWidth, child: const Text("FY 2023")),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.nep2023.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.gaa2023.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value:
                  project.financialAccomplishment.disbursement2023.toString(),
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(width: columnWidth, child: const Text("FY 2024")),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.nep2024.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.gaa2024.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value:
                  project.financialAccomplishment.disbursement2024.toString(),
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(width: columnWidth, child: const Text("FY 2025")),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.nep2025.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.gaa2025.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value:
                  project.financialAccomplishment.disbursement2025.toString(),
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(width: columnWidth, child: const Text("FY 2026")),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.nep2026.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.gaa2026.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value:
                  project.financialAccomplishment.disbursement2026.toString(),
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(width: columnWidth, child: const Text("FY 2027")),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.nep2027.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.gaa2027.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value:
                  project.financialAccomplishment.disbursement2027.toString(),
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(width: columnWidth, child: const Text("FY 2028")),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.nep2028.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value: project.financialAccomplishment.gaa2028.toString(),
              onChanged: (String value) {},
            ),
          ),
          DataCell(
            CostField(
              value:
                  project.financialAccomplishment.disbursement2028.toString(),
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(width: columnWidth, child: const Text("TOTAL")),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  ref
                      .watch(numberFormatterProvider)
                      .format(project.financialAccomplishment.nepTotal),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  ref
                      .watch(numberFormatterProvider)
                      .format(project.financialAccomplishment.gaaTotal),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  ref.watch(numberFormatterProvider).format(
                      project.financialAccomplishment.disbursementTotal),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
        ],
      ),
    ];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          dataRowMaxHeight: 40,
          dataRowMinHeight: 40,
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
}
