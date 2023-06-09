import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';

import '../../../../application/extensions.dart';
import '../../../../application/providers/numberformatter_provider.dart';
import '../../../../domain/models/fs_investment.dart';
import '../../../controllers/controllers.dart';
import '../cost_field.dart';

class UpdateInvestmentCost extends ConsumerStatefulWidget {
  const UpdateInvestmentCost({
    Key? key,
    this.uuid,
  }) : super(key: key);

  final String? uuid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateInvestmentCost();
}

class _UpdateInvestmentCost extends ConsumerState<UpdateInvestmentCost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: DataTable(
              dataRowMaxHeight: 40,
              dataRowMinHeight: 40,
              columnSpacing: 1,
              border: TableBorder.all(
                color: Colors.grey,
                width: 0.5,
                borderRadius: BorderRadius.circular(16),
              ),
              columns: _buildColumns(context),
              rows: [
                ..._buildRows(context, ref),
                _buildTotalRow(context, ref),
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            // ask user to provide a funding source
            final response = await showDialog(
                context: context,
                builder: (context) {
                  final options = ref.watch(optionsControllerProvider).value;

                  if (options?.data.fundingSources != null) {
                    return AlertDialog(
                      title: const Text('Select Funding Source'),
                      actions: [
                        CancelButton(onPressed: () {
                          Navigator.pop(context);
                        }),
                        FilledButton(
                            onPressed: () {
                              Navigator.pop(
                                  context, null); // TODO: return value
                            },
                            child: const Text('CONFIRM')),
                      ],
                    );
                  } else {
                    return const AlertDialog(
                      content: Text('Failed to load funding sources'),
                    );
                  }
                });

            if (response != null) {
              // add row
              final currentInvestment = ref
                  .watch(fullProjectControllerProvider(widget.uuid))
                  .fsInvestments
                  .toList();

              final updatedInvestment = [
                ...currentInvestment,
                FsInvestment.initial()
              ];

              ref
                  .read(fullProjectControllerProvider(widget.uuid).notifier)
                  .update(
                    fsInvestments: updatedInvestment,
                  );
            }
          },
          child: const Text('Add Row'),
        ),
      ],
    );
  }

  List<DataColumn> _buildColumns(BuildContext context) {
    final windowWidth =
        MediaQuery.of(context).size.width - 128; // remove horizontal margins
    final columnWidth = windowWidth / 10;

    return <DataColumn>[
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Text(
            'FUNDING SOURCE',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              "2022 & Prior",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              "2023",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              '2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              "2025",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              "2026",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              "2027",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              "2028",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: columnWidth,
          child: const Center(
            child: Text(
              "2029",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
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
    final windowWidth =
        MediaQuery.of(context).size.width - 128; // remove horizontal margins
    final columnWidth = windowWidth / 10;

    final project = ref.watch(fullProjectControllerProvider(widget.uuid));

    List<FsInvestment> fsInvestments = project.fsInvestments;

    // if (fsInvestments.isEmpty) {
    //   Future.delayed(Duration.zero, _initializeFsInvestments);
    // }

    return fsInvestments.map((fsInvestment) {
      return DataRow(
        cells: [
          DataCell(
            SizedBox(
              width: columnWidth,
              child:
                  Text(fsInvestment.fundingSource?.label ?? 'Funding Source'),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2022.toString(),
                onChanged: (String value) {
                  //
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2022: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2023.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2023: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2024.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2024: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2025.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2025: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2026.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2026: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2027.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2027: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2028.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2028: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: columnWidth,
              child: CostField(
                value: fsInvestment.y2029.toString(),
                onChanged: (String value) {
                  final updatedInvestments = [...project.fsInvestments];
                  final index = updatedInvestments.indexOf(fsInvestment);
                  final updatedFsInvestment = fsInvestment.copyWith(
                    y2029: double.parse(value),
                  );
                  updatedInvestments[index] = updatedFsInvestment;

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(
                        fsInvestments: updatedInvestments,
                      );
                },
              ),
            ),
          ),
          // TODO: make static Text
          DataCell(
            SizedBox(
              width: columnWidth,
              child: Text(
                ref.watch(numberFormatterProvider).format(fsInvestment.total),
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
      DataCell(
        Text(
          'GRAND TOTAL',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              ref.watch(numberFormatterProvider).format(ref
                  .watch(fullProjectControllerProvider(widget.uuid))
                  .fsInvestmentTotalRow
                  .y2022),
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .y2023),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .y2024),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .y2025),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .y2026),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .y2027),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .y2028),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .y2029),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      DataCell(
        SizedBox(
          width: columnWidth,
          child: Text(
            ref.watch(numberFormatterProvider).format(ref
                .watch(fullProjectControllerProvider(widget.uuid))
                .fsInvestmentTotalRow
                .grandTotal),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    ]);
  }
}
