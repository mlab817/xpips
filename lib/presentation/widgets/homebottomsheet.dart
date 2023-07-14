import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_controller.dart';
import '../controllers/options_controller.dart';
import 'loading_dialog.dart';

class HomeBottomSheet extends ConsumerWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final optionsAsync = ref.watch(optionsControllerProvider);

    // state of selections
    final selection = ref.watch(projectsRequestControllerProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('APPLY FILTERS'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('DISMISS'),
          ),
        ],
      ),
      body: optionsAsync.when(
          data: (data) {
            return SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'OFFICES',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.offices?.map((office) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    value: selection.offices
                                            ?.contains(office.value) ??
                                        false,
                                    onChanged: (bool? value) {
                                      final updatedSelection = ref
                                              .watch(
                                                  projectsRequestControllerProvider)
                                              .offices
                                              ?.toList() ??
                                          [];

                                      if (value != null && value) {
                                        updatedSelection.add(office.value);
                                      } else {
                                        updatedSelection.remove(office.value);
                                      }
                                      //
                                      ref
                                          .read(
                                              projectsRequestControllerProvider
                                                  .notifier)
                                          .update(offices: updatedSelection);
                                    }),
                                Text(office.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'TYPE',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.types?.map((type) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value:
                                      selection.types?.contains(type.value) ??
                                          false,
                                  onChanged: (bool? value) {
                                    print('value: $value');

                                    final updatedSelection = ref
                                            .watch(
                                                projectsRequestControllerProvider)
                                            .offices
                                            ?.toList() ??
                                        [];

                                    if (value != null && value) {
                                      updatedSelection.add(type.value);
                                    } else {
                                      updatedSelection.remove(type.value);
                                    }
                                    //
                                    ref
                                        .read(projectsRequestControllerProvider
                                            .notifier)
                                        .update(types: updatedSelection);
                                  },
                                ),
                                Text(type.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'SPATIAL COVERAGE',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.spatialCoverages?.map((spatialCoverage) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    value: selection.spatialCoverages
                                            ?.contains(spatialCoverage.value) ??
                                        false,
                                    onChanged: (bool? value) {
                                      final updatedSelection = ref
                                              .watch(
                                                  projectsRequestControllerProvider)
                                              .spatialCoverages
                                              ?.toList() ??
                                          [];

                                      if (value != null && value) {
                                        updatedSelection
                                            .add(spatialCoverage.value);
                                      } else {
                                        updatedSelection
                                            .remove(spatialCoverage.value);
                                      }
                                      //
                                      ref
                                          .read(
                                              projectsRequestControllerProvider
                                                  .notifier)
                                          .update(
                                              spatialCoverages:
                                                  updatedSelection);
                                    }),
                                Text(spatialCoverage.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'PROGRAMMING DOCUMENTS',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .pip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(pip: value);
                              },
                            ),
                            const Text('PIP'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .cip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(cip: value);
                              },
                            ),
                            const Text('CIP'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .trip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(trip: value);
                              },
                            ),
                            const Text('TRIP'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .rdip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(rdip: value);
                              },
                            ),
                            const Text('RDIP'),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'MAIN FUNDING SOURCE',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.fundingSources?.map((fundingSource) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: ref
                                          .watch(
                                              projectsRequestControllerProvider)
                                          .fundingSources
                                          ?.contains(fundingSource.value) ??
                                      false,
                                  onChanged: (bool? value) {
                                    final updatedSelection = ref
                                            .watch(
                                                projectsRequestControllerProvider)
                                            .fundingSources
                                            ?.toList() ??
                                        [];

                                    if (value != null && value) {
                                      updatedSelection.add(fundingSource.value);
                                    } else {
                                      updatedSelection
                                          .remove(fundingSource.value);
                                    }
                                    //
                                    ref
                                        .read(projectsRequestControllerProvider
                                            .notifier)
                                        .update(
                                            fundingSources: updatedSelection);
                                  },
                                ),
                                Text(fundingSource.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'PAP STATUS',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.projectStatuses?.map((projectStatus) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: ref
                                          .watch(
                                              projectsRequestControllerProvider)
                                          .projectStatuses
                                          ?.contains(projectStatus.value) ??
                                      false,
                                  onChanged: (bool? value) {
                                    final updatedSelection = ref
                                            .watch(
                                                projectsRequestControllerProvider)
                                            .projectStatuses
                                            ?.toList() ??
                                        [];

                                    if (value != null && value) {
                                      updatedSelection.add(projectStatus.value);
                                    } else {
                                      updatedSelection
                                          .remove(projectStatus.value);
                                    }

                                    ref
                                        .read(projectsRequestControllerProvider
                                            .notifier)
                                        .update(
                                            projectStatuses: updatedSelection);
                                  },
                                ),
                                Text(projectStatus.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, _) {
            return Center(
              child: Column(
                children: [
                  Text(error.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                    onPressed: () {
                      ref.invalidate(optionsControllerProvider);
                    },
                    child: const Text('TRY AGAIN'),
                  ),
                ],
              ),
            );
          },
          loading: () => const LoadingOverlay()),
    );
  }
}
