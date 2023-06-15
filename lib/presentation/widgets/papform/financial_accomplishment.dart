import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/repositories.dart';
import 'package:pips/domain/models/models.dart';
import 'package:pips/presentation/controllers/controllers.dart';

class FinancialAccomplishmentForm extends ConsumerStatefulWidget {
  const FinancialAccomplishmentForm({
    super.key,
    required this.project,
    required this.year,
    required this.nep,
    required this.gaa,
    required this.disbursement,
  });

  final FullProject project;
  final int year;
  final double nep;
  final double gaa;
  final double disbursement;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FinancialAccomplishmentFormState();
}

class _FinancialAccomplishmentFormState
    extends ConsumerState<FinancialAccomplishmentForm> {
  double? newNep;
  double? newGaa;
  double? newDisbursement;

  bool get isUpdated {
    return newNep != widget.nep ||
        newGaa != widget.gaa ||
        newDisbursement != widget.disbursement;
  }

  @override
  void initState() {
    super.initState();

    newNep = widget.nep;
    newGaa = widget.gaa;
    newDisbursement = widget.disbursement;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Financial Accomplishment FY ${widget.year}"),
        actions: [
          FilledButton(
            onPressed: isUpdated
                ? () {
                    final Map<String, dynamic> payload = {
                      'nep_${widget.year}': newNep,
                      'gaa_${widget.year}': newGaa,
                      'disbursement_${widget.year}': newDisbursement,
                    };

                    // send to server
                    ref.read(projectRepositoryProvider).updateFa(
                          widget.project.uuid!,
                          payload,
                        );

                    // update locally saved
                    switch (widget.year) {
                      case 2023:
                        ref
                            .read(fullProjectControllerProvider(
                                    widget.project.uuid)
                                .notifier)
                            .update(
                              financialAccomplishment: ref
                                      .watch(fullProjectControllerProvider(
                                          widget.project.uuid))
                                      .financialAccomplishment
                                      ?.copyWith(
                                        nep2023: newNep,
                                        gaa2023: newGaa,
                                        disbursement2023: newDisbursement,
                                      ) ??
                                  FinancialAccomplishment(
                                    nep2023: newNep,
                                    gaa2023: newGaa,
                                    disbursement2023: newDisbursement,
                                  ),
                            );
                        break;
                      case 2024:
                        ref
                            .read(fullProjectControllerProvider(
                                    widget.project.uuid)
                                .notifier)
                            .update(
                              financialAccomplishment: ref
                                      .watch(fullProjectControllerProvider(
                                          widget.project.uuid))
                                      .financialAccomplishment
                                      ?.copyWith(
                                        nep2024: newNep,
                                        gaa2024: newGaa,
                                        disbursement2024: newDisbursement,
                                      ) ??
                                  FinancialAccomplishment(
                                    nep2024: newNep,
                                    gaa2024: newGaa,
                                    disbursement2024: newDisbursement,
                                  ),
                            );
                        break;
                      case 2025:
                        ref
                            .read(fullProjectControllerProvider(
                                    widget.project.uuid)
                                .notifier)
                            .update(
                              financialAccomplishment: ref
                                      .watch(fullProjectControllerProvider(
                                          widget.project.uuid))
                                      .financialAccomplishment
                                      ?.copyWith(
                                        nep2025: newNep,
                                        gaa2025: newGaa,
                                        disbursement2025: newDisbursement,
                                      ) ??
                                  FinancialAccomplishment(
                                    nep2025: newNep,
                                    gaa2025: newGaa,
                                    disbursement2025: newDisbursement,
                                  ),
                            );
                        break;
                      case 2026:
                        ref
                            .read(fullProjectControllerProvider(
                                    widget.project.uuid)
                                .notifier)
                            .update(
                              financialAccomplishment: ref
                                      .watch(fullProjectControllerProvider(
                                          widget.project.uuid))
                                      .financialAccomplishment
                                      ?.copyWith(
                                        nep2026: newNep,
                                        gaa2026: newGaa,
                                        disbursement2026: newDisbursement,
                                      ) ??
                                  FinancialAccomplishment(
                                    nep2026: newNep,
                                    gaa2026: newGaa,
                                    disbursement2026: newDisbursement,
                                  ),
                            );
                        break;
                      case 2027:
                        ref
                            .read(fullProjectControllerProvider(
                                    widget.project.uuid)
                                .notifier)
                            .update(
                              financialAccomplishment: ref
                                      .watch(fullProjectControllerProvider(
                                          widget.project.uuid))
                                      .financialAccomplishment
                                      ?.copyWith(
                                        nep2027: newNep,
                                        gaa2027: newGaa,
                                        disbursement2027: newDisbursement,
                                      ) ??
                                  FinancialAccomplishment(
                                    nep2027: newNep,
                                    gaa2027: newGaa,
                                    disbursement2027: newDisbursement,
                                  ),
                            );
                        break;
                      case 2028:
                        ref
                            .read(fullProjectControllerProvider(
                                    widget.project.uuid)
                                .notifier)
                            .update(
                              financialAccomplishment: ref
                                      .watch(fullProjectControllerProvider(
                                          widget.project.uuid))
                                      .financialAccomplishment
                                      ?.copyWith(
                                        nep2028: newNep,
                                        gaa2028: newGaa,
                                        disbursement2028: newDisbursement,
                                      ) ??
                                  FinancialAccomplishment(
                                    nep2028: newNep,
                                    gaa2028: newGaa,
                                    disbursement2028: newDisbursement,
                                  ),
                            );
                        break;
                      default:
                        break;
                    }
                  }
                : null,
            child: const Text('UPDATE'),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: newNep.toString(),
              decoration: const InputDecoration(labelText: "NEP"),
              onChanged: (String value) {
                setState(() {
                  newNep = double.tryParse(value);
                });
              },
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: newGaa.toString(),
              decoration: const InputDecoration(labelText: "GAA"),
              onChanged: (String value) {
                setState(() {
                  newGaa = double.tryParse(value);
                });
              },
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: newDisbursement.toString(),
              decoration: const InputDecoration(labelText: "DISBURSEMENT"),
              onChanged: (String value) {
                setState(() {
                  newDisbursement = double.tryParse(value);
                });
              },
            ),
          )),
        ],
      ),
    );
  }
}
