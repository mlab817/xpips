import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../../presentation/widgets/papform/common/scheduleeditor.dart';
import '../resources/strings_manager.dart';
import '../widgets/papform/common/fsinvestmenteditor.dart';
import '../widgets/papform/common/regionalinvestmenteditor.dart';
import '../widgets/papform/common/checkboxeditor.dart';
import '../../application/app_router.dart';
import '../../application/extensions.dart';
import '../../application/providers/numberformatter_provider.dart';
import '../../data/repositories/repositories.dart';
import '../../data/responses/responses.dart';
import '../../domain/models/models.dart';
import '../../presentation/controllers/controllers.dart';
import '../widgets/papform/common/switcheditor.dart';
import '../widgets/papform/common/dateeditor.dart';
import '../widgets/papform/common/radioeditor.dart';
import '../widgets/papform/common/sliverstickyheader.dart';
import '../widgets/papform/common/texteditor.dart';
import '../widgets/papform/financial_accomplishment.dart';
import '../widgets/papform/form_objects/infrastructuresectors.dart';
import '../widgets/papform/form_objects/officeeditor.dart';
import '../widgets/papform/form_objects/projectattachment.dart';

@RoutePage()
class PapViewScreen extends ConsumerStatefulWidget {
  const PapViewScreen({
    Key? key,
    @PathParam('uuid') required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  ConsumerState<PapViewScreen> createState() => _PapViewScreenState();
}

class _PapViewScreenState extends ConsumerState<PapViewScreen> {
  Future<PatchProjectResponse> _handleSubmit({
    required String uuid,
    required String fieldKey,
    required dynamic value,
  }) async {
    final Map<String, dynamic> payload = {
      fieldKey: value,
    };

    return await ref
        .read(patchProjectControllerProvider.notifier)
        .submit(uuid: uuid, payload: payload);
  }

  @override
  Widget build(BuildContext context) {
    final projectProfileAsync =
        ref.watch(futureProjectProvider(uuid: widget.uuid));

    // listen for the status of the patch request
    ref.listen(patchProjectControllerProvider, (previous, next) {
      // if there was an error in the patch request, show error message
      if (next.hasError) {
        next.showSnackbarOnError(context);
      }

      // if the patch request was successful, show success message
      if (next.hasValue) {
        next.showSnackbarOnSuccess(context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).push(const HomeRoute());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          projectProfileAsync.value?.project.title ?? 'NO TITLE',
          overflow: TextOverflow.ellipsis,
        ),
        // scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              // reload the project
              ref.invalidate(futureProjectProvider(uuid: widget.uuid));
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Reload',
          ),
          IconButton(
            onPressed: () async {
              // todo: handle confirm delete
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text(
                          'Deleted PAPs cannot be restored. If you wish to go back to this PAP later, drop it instead. If you still wish to proceed, tap Confirm button below.'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            // TODO: handle drop
                          },
                          child: const Text('DROP'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('CANCEL'),
                        ),
                        FilledButton(
                          onPressed: () async {
                            // TODO: handle deletion
                            try {
                              await ref
                                  .read(projectRepositoryProvider)
                                  .delete(widget.uuid);
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(error.toString())));
                            } finally {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('CONFIRM'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.delete),
            tooltip: AppStrings.delete,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Tooltip(
              message:
                  'Ensure that all fields have been filled up and are consistent.',
              child: FilledButton(
                onPressed: () {
                  //
                },
                child: const Text('SUBMIT'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildChatBadge(),
      body: Stack(
        children: [
          // content
          projectProfileAsync.when(
            data: (data) {
              return _buildShow(data);
            },
            error: (error, stacktrace) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBadge() {
    final asyncValue = ref.watch(combinedCommentsProvider(uuid: widget.uuid));

    return asyncValue.when(data: (data) {
      return Badge(
        label: Text(data.length.toString()),
        child: FloatingActionButton(
          onPressed: () {
            // expand messenger like
            AutoRouter.of(context).push(CommentsRoute(uuid: widget.uuid));
          },
          child: const Icon(Icons.chat_bubble),
        ),
      );
    }, error: (error, stacktrace) {
      return const Badge();
    }, loading: () {
      return Container();
    });
  }

  Widget _buildShow(ProjectResponse response) {
    final FullProject project =
        ref.watch(fullProjectControllerProvider(widget.uuid));

    final options =
        ref.watch(optionsControllerProvider).value?.data ?? FormOptions();

    final uuid = widget.uuid;

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        // General Information
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
              title: AppStrings.generalInformation),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                TextEditor(
                  project: project,
                  fieldLabel: 'Title',
                  oldValue: project.title ?? '',
                  onSubmit: (String newValue) async {
                    //
                    await _handleSubmit(
                        uuid: widget.uuid, fieldKey: 'title', value: newValue);

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(title: newValue);
                  },
                ),
                RadioEditor(
                    project: project,
                    fieldLabel: 'Program or Project',
                    oldValue: project.type,
                    onSubmit: (newValue) async {
                      await _handleSubmit(
                        uuid: widget.uuid,
                        fieldKey: 'type_id',
                        value: newValue.value,
                      );

                      // update the provider
                      ref
                          .read(fullProjectControllerProvider(widget.uuid)
                              .notifier)
                          .update(type: newValue);
                    },
                    options: options.types ?? []),
                SwitchEditor(
                  project: project,
                  fieldLabel: 'Regular Program',
                  oldValue: project.regularProgram ?? false,
                  enabled: project.type?.value == 1, // if type is program
                  onSubmit: (bool newValue) async {
                    await _handleSubmit(
                        uuid: uuid,
                        fieldKey: 'regular_program',
                        value: newValue);

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(regularProgram: newValue);
                  },
                ),
                CheckboxEditor(
                  project: project,
                  fieldLabel: 'Basis for Implementation',
                  options:
                      ref.watch(optionsControllerProvider).value?.data.bases ??
                          [],
                  oldValue: ref
                      .watch(fullProjectControllerProvider(widget.uuid))
                      .bases,
                  onSubmit: (List<Option> newValue) async {
                    // conver to list of value
                    final valueToSubmit = newValue.map((e) => e.value).toList();

                    await _handleSubmit(
                      uuid: uuid,
                      fieldKey: 'bases',
                      value: valueToSubmit,
                    );

                    ref
                        .watch(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(bases: newValue);
                  },
                ),
                TextEditor(
                  project: project,
                  fieldLabel: 'Description',
                  oldValue: project.description ?? '',
                  onSubmit: (String newValue) async {
                    //
                    await _handleSubmit(
                      uuid: uuid,
                      fieldKey: 'description',
                      value: newValue,
                    );

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(uuid).notifier)
                        .update(description: newValue);
                  },
                ),
                TextEditor(
                  project: project,
                  oldValue: ref
                      .watch(numberFormatterProvider)
                      .format(project.totalCost),
                  fieldLabel: 'Total Project Cost (in absolute PHP)',
                  onSubmit: (String newValue) async {
                    //
                    await _handleSubmit(
                      uuid: uuid,
                      fieldKey: 'total_cost',
                      value: double.tryParse(newValue),
                    );

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(uuid).notifier)
                        .update(
                          totalCost: double.tryParse(newValue),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
        // Implementing Offices/Units
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
              title: 'Implementing Offices/Units'),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              OfficeEditor(
                project: project,
                fieldLabel: 'Reporting Office',
                options: ref.watch(officesProvider).value?.data ?? <Office>[],
                oldValue: project.office,
                onSubmit: (Office newValue) async {
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'office_id',
                    value: newValue.value,
                  );

                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(office: newValue);
                },
              ),
              CheckboxEditor(
                  project: project,
                  fieldLabel: 'Implementing Units',
                  oldValue: project.operatingUnits,
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .operatingUnits ??
                      [],
                  onSubmit: (List<Option> newValue) async {
                    // convert to List<int>
                    final valueToSubmit = newValue.map((e) => e.value).toList();

                    await _handleSubmit(
                      uuid: uuid,
                      fieldKey: 'operating_units',
                      value: valueToSubmit,
                    );

                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(operatingUnits: newValue);
                  }),
            ]),
          ),
        ),
        // Spatial Coverage
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Spatial Coverage',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                project: project,
                fieldLabel: 'Spatial Coverage',
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .spatialCoverages ??
                    [],
                oldValue: project.spatialCoverage,
                onSubmit: (Option newValue) async {
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'spatial_coverage_id',
                    value: newValue.value,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(spatialCoverage: newValue);
                },
              ),
              CheckboxEditor(
                project: project,
                oldValue: project.regions,
                fieldLabel: 'Regions',
                onSubmit: (newValue) async {
                  final valueToSubmit = newValue.map((e) => e.value).toList();
                  //
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'regions',
                    value: valueToSubmit,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(regions: newValue);
                },
                options: options.regions ?? [],
              ),
              CheckboxEditor(
                project: project,
                oldValue: project.provinces,
                fieldLabel: 'Provinces',
                onSubmit: (List<Option> newValue) async {
                  //
                  final List<int> valueToSubmit =
                      newValue.map((e) => e.value).toList();
                  //
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'provinces',
                    value: valueToSubmit,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(provinces: newValue);
                },
                options: options.provinces ?? [],
              ),
            ]),
          ),
        ),
        // Level of Approval
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(title: 'Level of Approval'),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SwitchEditor(
                project: project,
                fieldLabel:
                    'Will require Investment Coordination Committee/NEDA Board Approval (ICC-able)?',
                oldValue: project.iccable ?? false,
                onSubmit: (bool newValue) async {
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'iccable',
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(iccable: newValue);
                },
              ),
              RadioEditor(
                project: project,
                fieldLabel: 'Approval Level',
                oldValue: project.approvalLevel,
                enabled: ref
                        .watch(fullProjectControllerProvider(widget.uuid))
                        .iccable ??
                    false,
                onSubmit: (Option newValue) async {
                  //
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'approval_level_id',
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(approvalLevel: newValue);
                },
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .approvalLevels ??
                    [],
              ),
              DateEditor(
                  project: project,
                  fieldLabel: 'As of',
                  oldValue: project.approvalLevelDate,
                  enabled: ref
                          .watch(fullProjectControllerProvider(widget.uuid))
                          .iccable ??
                      false,
                  onSubmit: (DateTime newValue) async {
                    //
                    await _handleSubmit(
                      uuid: uuid,
                      fieldKey: 'approval_level_date',
                      value: newValue.toIso8601String(),
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(approvalLevelDate: newValue);
                  }),
            ]),
          ),
        ),
        // Project for Inclusion in Which Programming Document
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
              title: 'Project for Inclusion in Which Programming Document'),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SwitchEditor(
                project: project,
                fieldLabel: 'Public Investment Program (PIP)',
                oldValue: project.pip ?? false,
                onSubmit: (bool newValue) async {
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'pip',
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(pip: newValue);
                },
              ),
              RadioEditor(
                  project: project,
                  fieldLabel: 'Typology of PIP',
                  oldValue: project.typology,
                  enabled: ref
                          .watch(fullProjectControllerProvider(widget.uuid))
                          .pip ??
                      false,
                  onSubmit: (Option newValue) async {
                    await _handleSubmit(
                      uuid: uuid,
                      fieldKey: 'typology_id',
                      value: newValue.value,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(typology: newValue);
                  },
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .typologies ??
                      []),
              SwitchEditor(
                project: project,
                fieldLabel: 'Core Investment Programs/Projects (CIP)',
                oldValue: project.cip ?? false,
                onSubmit: (bool newValue) async {
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'cip',
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(cip: newValue);
                },
              ),
              RadioEditor(
                  project: project,
                  fieldLabel: 'Type of CIP',
                  oldValue: project.cipType,
                  enabled: project.cip ?? false,
                  onSubmit: (Option newValue) async {
                    await _handleSubmit(
                      uuid: uuid,
                      fieldKey: 'cip_type_id',
                      value: newValue.value,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(cipType: newValue);
                  },
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .cipTypes ??
                      []),
              SwitchEditor(
                project: project,
                fieldLabel: 'Three Year Rolling Infrastructure Program',
                oldValue: project.trip ?? false,
                onSubmit: (bool newValue) async {
                  await _handleSubmit(
                    uuid: uuid,
                    fieldKey: 'trip',
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(trip: newValue);
                },
              ),
              SwitchEditor(
                project: project,
                fieldLabel: 'Is it a Research and Development Program/Project?',
                oldValue: project.research ?? false,
                onSubmit: (bool value) async {
                  try {
                    await _handleSubmit(
                        fieldKey: 'research', uuid: widget.uuid, value: value);

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(research: value);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  }
                },
              ),
              SwitchEditor(
                project: project,
                fieldLabel:
                    'Is it responsive to COVID-19/New Normal Intervention?',
                oldValue: project.covid ?? false,
                onSubmit: (bool newValue) async {
                  await _handleSubmit(
                    fieldKey: 'covid',
                    uuid: widget.uuid,
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(covid: newValue);
                },
              ),
              SwitchEditor(
                project: project,
                fieldLabel: 'Is the Program/Project included in the RDIP?',
                oldValue: project.rdip ?? false,
                onSubmit: (bool newValue) async {
                  await _handleSubmit(
                    fieldKey: 'rdip',
                    uuid: widget.uuid,
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(rdip: newValue);
                },
              ),
            ]),
          ),
        ),
        // PDP chapters
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Philippine Development Plan (PDP) Chapter',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                RadioEditor(
                  project: project,
                  fieldLabel: 'Philippine Development Plan (PDP) Chapter',
                  oldValue: project.pdpChapter,
                  onSubmit: (Option newValue) async {
                    await _handleSubmit(
                      fieldKey: 'pdp_chapter_id',
                      uuid: widget.uuid,
                      value: newValue.value,
                    );

                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(pdpChapter: newValue);
                  },
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .pdpChapters ??
                      [],
                ),
                CheckboxEditor(
                  project: project,
                  fieldLabel:
                      'Other Philippine Development Plan (PDP) Chapter/s',
                  oldValue: project.pdpChapters,
                  onSubmit: (List<Option> newValue) async {
                    // convert to List<int> for backend processing
                    final List<int> valueToSubmit =
                        newValue.map((e) => e.value).toList();
                    //
                    await _handleSubmit(
                      fieldKey: 'pdp_chapters',
                      uuid: widget.uuid,
                      value: valueToSubmit,
                    );

                    // update local State
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(pdpChapters: newValue);
                  },
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .pdpChapters ??
                      [],
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Main Infrastructure Sector/Subsector',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              UpdateInfraSectors(
                project: project,
                oldValue: project.infrastructureSectors,
                options: options.infrastructureSectors ?? [],
                onSubmit: (List<Option> newValue) async {
                  //
                  final List<int> valueToSubmit =
                      newValue.map((e) => e.value).toList();

                  await _handleSubmit(
                    fieldKey: 'infrastructure_sectors',
                    uuid: widget.uuid,
                    value: valueToSubmit,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(infrastructureSectors: newValue);
                },
              ),
              CheckboxEditor(
                  project: project,
                  fieldLabel: 'Prerequisites',
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .prerequisites ??
                      [],
                  oldValue: project.prerequisites,
                  enabled: ref
                          .watch(fullProjectControllerProvider(widget.uuid))
                          .trip ??
                      false,
                  onSubmit: (List<Option> newValue) async {
                    // convert to list of ints e.g. [1,2,3]
                    final List<int> valueToSubmit =
                        newValue.map((e) => e.value).toList();

                    await _handleSubmit(
                      fieldKey: 'prerequisites',
                      uuid: widget.uuid,
                      value: valueToSubmit,
                    );

                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(prerequisites: newValue);
                  }),
              TextEditor(
                project: project,
                fieldLabel: 'Implementation Risks and Mitigation Strategies',
                oldValue: project.risk ?? 'NO DATA',
                enabled: ref
                        .watch(fullProjectControllerProvider(widget.uuid))
                        .trip ??
                    false,
                onSubmit: (String newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'implementation_risk',
                    uuid: uuid,
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(risk: newValue);
                },
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Expected Outputs/Deliverables',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              TextEditor(
                  project: project,
                  fieldLabel: 'Expected Outputs/Deliverables',
                  oldValue: project.expectedOutputs ?? 'NO DATA',
                  onSubmit: (String newValue) async {
                    await _handleSubmit(
                      fieldKey: 'expected_outputs',
                      uuid: uuid,
                      value: newValue,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(expectedOutputs: newValue);
                  }),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: '8-Point Socioeconomic Agenda',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              CheckboxEditor(
                  project: project,
                  fieldLabel: '8-Point Socioeconomic Agenda',
                  options:
                      ref.watch(optionsControllerProvider).value?.data.agenda ??
                          [],
                  oldValue: project.agenda,
                  onSubmit: (List<Option> newValue) async {
                    final List<int> valueToSubmit =
                        newValue.map((e) => e.value).toList();

                    await _handleSubmit(
                      fieldKey: 'agenda',
                      uuid: uuid,
                      value: valueToSubmit,
                    );

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(uuid).notifier)
                        .update(agenda: newValue);
                  }),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Sustainable Development Goals',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              CheckboxEditor(
                  project: project,
                  fieldLabel: 'Sustainable Development Goals',
                  options:
                      ref.watch(optionsControllerProvider).value?.data.sdgs ??
                          [],
                  oldValue: project.sdgs,
                  onSubmit: (List<Option> newValue) async {
                    final List<int> valueToSubmit =
                        newValue.map((e) => e.value).toList();
                    //
                    await _handleSubmit(
                      fieldKey: 'sdgs',
                      uuid: uuid,
                      value: valueToSubmit,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(sdgs: newValue);
                  }),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Level of GAD Responsiveness [CIP Only]',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                  project: project,
                  fieldLabel: 'Level of GAD Responsiveness',
                  oldValue: project.gad,
                  enabled: project.cip ?? false, // enable if project is CIP
                  onSubmit: (Option newValue) async {
                    await _handleSubmit(
                      fieldKey: 'gad_id',
                      uuid: uuid,
                      value: newValue.value,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(gad: newValue);
                  },
                  options:
                      ref.watch(optionsControllerProvider).value?.data.gads ??
                          []),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Project Preparation Details [CIP Only]',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                project: project,
                fieldLabel: 'Project Preparation Document',
                oldValue: project.preparationDocument,
                onSubmit: (Option newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'preparation_document_id',
                    uuid: uuid,
                    value: newValue,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(preparationDocument: newValue);
                },
                enabled: project.cip ?? false,
                options: options.preparationDocuments ?? [],
              ),
              // FS details
              SwitchEditor(
                  project: project,
                  fieldLabel: 'Will require assistance for the conduct of F/S?',
                  oldValue: project.fsNeedsAssistance ?? false,
                  enabled: project.cip ?? false,
                  onSubmit: (bool newValue) async {
                    //
                    await _handleSubmit(
                      fieldKey: 'fs_needs_assistance',
                      uuid: uuid,
                      value: newValue,
                    );

                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(fsNeedsAssistance: newValue);
                  }),
              RadioEditor(
                project: project,
                fieldLabel: 'Status of F/S',
                oldValue: project.fsStatus,
                enabled: project.cip ?? false,
                onSubmit: (newValue) async {
                  await _handleSubmit(
                    fieldKey: 'fs_status_id',
                    uuid: uuid,
                    value: newValue,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(fsStatus: newValue);
                },
                options: options.fsStatuses ?? [],
              ),
              ScheduleEditor(
                title: 'Schedule of Feasibility Study',
                oldValue: project.fsCost ?? CostSchedule.initial(),
                enabled: project.cip ?? false,
                onSubmit: (CostSchedule newValue) async {
                  ref
                      .read(updateFsProvider.notifier)
                      .submit(uuid: uuid, payload: newValue);

                  //
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(fsCost: newValue);
                },
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Pre-construction Costs [CIP Only]',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SwitchEditor(
                project: project,
                fieldLabel: 'Has Right of Way',
                oldValue: project.hasRow ?? false,
                enabled: project.cip ?? false, // enable if CIP
                onSubmit: (bool newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'has_row',
                    uuid: uuid,
                    value: newValue,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(hasRow: newValue);
                },
              ),
              TextEditor(
                  project: project,
                  fieldLabel: 'Affected Households (number)',
                  oldValue: project.rowAffectedHouseholds?.toString() ?? 'NONE',
                  enabled: project.cip ?? false, // enable if CIP
                  onSubmit: (newValue) async {
                    //
                    await _handleSubmit(
                      fieldKey: 'row_affected_households',
                      uuid: uuid,
                      value: int.tryParse(newValue),
                    );

                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(rowAffectedHouseholds: int.tryParse(newValue));
                  }),
              ScheduleEditor(
                title: 'Right of Way Schedule',
                oldValue: project.rowCost ?? CostSchedule.initial(),
                enabled: project.cip ?? false, // enable if CIP
                onSubmit: (CostSchedule newValue) {
                  //
                  ref
                      .read(updateRowProvider.notifier)
                      .submit(uuid: uuid, payload: newValue);

                  //
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(rowCost: newValue);
                },
              ),
              const Divider(),
              SwitchEditor(
                project: project,
                fieldLabel: 'Has Resettlement Action Plan',
                oldValue: project.hasRap ?? false,
                enabled: project.cip ?? false,
                onSubmit: (bool newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'has_rap',
                    uuid: uuid,
                    value: newValue,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(fsNeedsAssistance: newValue);
                },
              ),
              TextEditor(
                  project: project,
                  fieldLabel: 'Affected Households (number)',
                  oldValue: project.rapAffectedHouseholds?.toString() ?? 'NONE',
                  enabled: project.cip ?? false,
                  onSubmit: (String newValue) async {
                    //
                    await _handleSubmit(
                      fieldKey: 'rap_affected_households',
                      uuid: uuid,
                      value: int.tryParse(newValue),
                    );

                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(rapAffectedHouseholds: int.tryParse(newValue));
                  }),
              // ROWA
              ScheduleEditor(
                title: 'Resettlement Action Plan Schedule',
                oldValue: project.rapCost ?? CostSchedule.initial(),
                enabled: project.cip ?? false,
                onSubmit: (CostSchedule newValue) {
                  //
                  //
                  ref
                      .read(updateRapProvider.notifier)
                      .submit(uuid: uuid, payload: newValue);

                  //
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(rapCost: newValue);
                },
              ),
              // RAP
              // ROWA/RAP
              const Divider(),
              SwitchEditor(
                project: project,
                fieldLabel: 'Has Right of Way and Resettlement Action Plan',
                oldValue: project.hasRowRap ?? false,
                enabled: project.cip ?? false,
                onSubmit: (bool newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'has_row_rap',
                    uuid: uuid,
                    value: newValue,
                  );

                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(hasRowRap: newValue);
                },
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Employment Generation',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              TextEditor(
                fieldLabel: 'Number of males employed',
                oldValue: project.employedMale?.toString() ?? '0',
                onSubmit: (String newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'employed_male',
                    uuid: uuid,
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(employedMale: int.tryParse(newValue));
                },
                project: project,
              ),
              // ROWA
              TextEditor(
                  fieldLabel: 'Number of females employed',
                  oldValue: project.employedFemale?.toString() ?? '0',
                  onSubmit: (String newValue) async {
                    await _handleSubmit(
                      fieldKey: 'employed_female',
                      uuid: uuid,
                      value: newValue,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(employedFemale: int.tryParse(newValue));
                  },
                  project: project),
              // RAP
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  subtitle: Text(project.totalEmployment().toString()),
                  title: const Text('Total Employed (auto-computed)'),
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Funding Source and Mode of Implementation',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                project: project,
                fieldLabel: 'Main Funding Source',
                oldValue: project.fundingSource,
                onSubmit: (Option newValue) async {
                  await _handleSubmit(
                    fieldKey: 'funding_source_id',
                    uuid: uuid,
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(fundingSource: newValue);
                },
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .fundingSources ??
                    [],
              ),
              CheckboxEditor(
                  project: project,
                  fieldLabel: 'Other Funding Sources',
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .fundingSources
                          ?.where((element) =>
                              ref
                                  .watch(fullProjectControllerProvider(
                                      widget.uuid))
                                  .fundingSource !=
                              element)
                          .toList() ??
                      [],
                  oldValue: project.fundingSources,
                  onSubmit: (List<Option> newValue) async {
                    final List<int> valueToSubmit =
                        newValue.map((e) => e.value).toList();
                    //
                    await _handleSubmit(
                      fieldKey: 'funding_sources',
                      uuid: uuid,
                      value: valueToSubmit,
                    );

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(uuid).notifier)
                        .update(fundingSources: newValue);
                  }),
              CheckboxEditor(
                  project: project,
                  fieldLabel: 'ODA Funding Institutions',
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .fundingInstitutions ??
                      [],
                  oldValue: project.fundingInstitutions,
                  onSubmit: (List<Option> newValue) async {
                    //
                    final List<int> valueToSubmit =
                        newValue.map((e) => e.value).toList();
                    //
                    await _handleSubmit(
                      fieldKey: 'funding_institutions',
                      uuid: uuid,
                      value: valueToSubmit,
                    );

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(uuid).notifier)
                        .update(fundingInstitutions: newValue);
                  }),
              RadioEditor(
                project: project,
                fieldLabel: 'Mode of Implementation/Procurement',
                oldValue: project.implementationMode,
                onSubmit: (Option newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'implementation_mode_id',
                    uuid: uuid,
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(implementationMode: newValue);
                },
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .implementationModes ??
                    [],
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Investment Cost per Funding Source',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildFinancialTable(project, options),
                _buildAddFs(project, options),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Investment Cost per Region',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildRegionalTable(project, options),
                // TODO: only enable if current regions < all regions
                _buildAddRegion(project),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Physical and Financial Status',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                project: project,
                fieldLabel: 'Category',
                oldValue: project.category,
                onSubmit: (Option newValue) async {
                  // TODO: implement Category

                  //
                  await _handleSubmit(
                    fieldKey: 'category_id',
                    uuid: uuid,
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(category: newValue);
                },
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .categories ??
                    [],
              ),
              RadioEditor(
                project: project,
                fieldLabel: 'Status of Implementation Readiness',
                oldValue: project.projectStatus,
                onSubmit: (Option newValue) async {
                  await _handleSubmit(
                    fieldKey: 'project_status_id',
                    uuid: uuid,
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(projectStatus: newValue);
                },
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .projectStatuses ??
                    [],
              ),
              RadioEditor(
                project: project,
                fieldLabel: 'Level of Readiness',
                oldValue: project.readinessLevel,
                onSubmit: (Option newValue) async {
                  await _handleSubmit(
                    fieldKey: 'readiness_level_id',
                    uuid: uuid,
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(readinessLevel: newValue);
                },
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .readinessLevels ??
                    [],
              ),
              SwitchEditor(
                project: project,
                fieldLabel: 'Will require resubmission to the ICC?',
                oldValue: project.iccResubmission ?? false,
                enabled: project.iccable ?? false, // only if the PAP is iccable
                onSubmit: (bool newValue) async {
                  //
                  await _handleSubmit(
                    fieldKey: 'icc_resubmission',
                    uuid: uuid,
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(iccResubmission: newValue);
                },
              ),
              TextEditor(
                project: project,
                fieldLabel: 'Updates',
                oldValue: project.updates ?? 'NO DATA',
                onSubmit: (String newValue) async {
                  //
                  await _handleSubmit(
                    uuid: widget.uuid,
                    fieldKey: 'updates',
                    value: newValue,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(widget.uuid).notifier)
                      .update(updates: newValue);
                },
              ),
              DateEditor(
                  project: project,
                  fieldLabel: 'As of',
                  oldValue: project.asOf,
                  onSubmit: (DateTime newValue) async {
                    //
                    await _handleSubmit(
                      fieldKey: 'updates_as_of',
                      uuid: uuid,
                      value: newValue.toIso8601String(),
                    );

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(uuid).notifier)
                        .update(asOf: newValue);
                  }),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Implementation Period',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                project: project,
                fieldLabel: 'Start of Project Implementation',
                oldValue: project.startYear,
                onSubmit: (Option newValue) async {
                  await _handleSubmit(
                    fieldKey: 'start_year_id',
                    uuid: uuid,
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(startYear: newValue);
                },
                options:
                    ref.watch(optionsControllerProvider).value?.data.years ??
                        [],
              ),
              RadioEditor(
                project: project,
                fieldLabel: 'Year of Project Completion',
                oldValue: project.endYear,
                onSubmit: (Option newValue) async {
                  await _handleSubmit(
                    fieldKey: 'end_year_id',
                    uuid: uuid,
                    value: newValue.value,
                  );

                  // update the provider
                  ref
                      .read(fullProjectControllerProvider(uuid).notifier)
                      .update(endYear: newValue);
                },
                options:
                    ref.watch(optionsControllerProvider).value?.data.years ??
                        [],
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Financial Accomplishments',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildFinancialAccomplishments(project),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: SliverStickyHeaderComponent(
              title: 'Supporting Documents [PDF Only]',
              actions: [
                TextButton(
                  onPressed: () {
                    //
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const Dialog(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Supporting Documents'),
                                    SizedBox(height: 20),
                                    Text('ALL PROJECTS',
                                        textAlign: TextAlign.center),
                                    Text(
                                        'Project Concept Note/Project Proposal'),
                                    Text('Pre-Feasibility Study/Business Case'),
                                    Text('Feasibility Study'),
                                    SizedBox(height: 10),
                                    Text(
                                        'CORE INVESTMENT PROGRAMS/PROJECTS (CIPs)'),
                                    Text('RDC Endorsement'),
                                    Text('Level of Approval (CIP)'),
                                    Text('GAD Checklist (CIP)'),
                                    SizedBox(height: 10),
                                    Text('INFRASTRUCTURE PROJECTS'),
                                    Text('Right-of-Way Acquisition'),
                                    Text('Resettlement Action Plan'),
                                    Text(
                                        'Environmental Compliance Certificate'),
                                    Text('Detailed Engineering Design'),
                                    SizedBox(height: 10),
                                    Text('GRANT'),
                                    Text(
                                        'Proof of Grant (e.g., letter from funding Agency)'),
                                    Text(
                                        'Letter of request/proposal to funding Agency'),
                                    SizedBox(height: 10),
                                    Text('PPP/JOINT VENTURE'),
                                    Text('Memorandum of Agreement'),
                                  ]),
                            ),
                          );
                        });
                  },
                  child: const Text(
                    'Need help?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ProjectAttachment(
                project: project,
                options: options.attachmentTypes ?? [],
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Contact Information',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                TextEditor(
                  project: project,
                  fieldLabel: 'Contact Information',
                  oldValue: project.contactInformation ?? 'NO DATA',
                  onSubmit: (String newValue) async {
                    await _handleSubmit(
                      fieldKey: 'contact_information',
                      uuid: uuid,
                      value: newValue,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(contactInformation: newValue);
                  },
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Notes',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                TextEditor(
                  project: project,
                  fieldLabel: 'Notes',
                  oldValue: project.notes ?? 'NO DATA',
                  onSubmit: (String newValue) async {
                    //
                    await _handleSubmit(
                      fieldKey: 'notes',
                      uuid: uuid,
                      value: newValue,
                    );

                    // update the provider
                    ref
                        .read(
                            fullProjectControllerProvider(widget.uuid).notifier)
                        .update(notes: newValue);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegionalTable(FullProject project, FormOptions options) {
    final List<RegionalInvestment> regionInvestments =
        project.regionalInvestments;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border:
            TableBorder.all(color: Theme.of(context).primaryColor, width: 0.5),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          const TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('REGION'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2022 & Prior',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2023',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2024',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2025',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2026',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2027',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2028',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2029 & Beyond',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'TOTAL',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'ACTIONS',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          ...regionInvestments.map((e) {
            return TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.region?.label ?? 'N/A'),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2022.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2022),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2023.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2023),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2024.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2024),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2025.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2025),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2026.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2026),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2027.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2027),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2028.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2028),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2029.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2029),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.total),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                          onPressed: () async {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              //
                              return RegionalInvestmentEditor(
                                  project: project,
                                  options: ref
                                          .watch(optionsControllerProvider)
                                          .value
                                          ?.data
                                          .regions ??
                                      [],
                                  oldValue: e,
                                  onSubmit: (newValue) async {
                                    final response = await ref
                                        .read(projectRepositoryProvider)
                                        .updateRegionalInvestment(
                                            widget.uuid, newValue);

                                    //
                                    ref
                                        .read(fullProjectControllerProvider(
                                                widget.uuid)
                                            .notifier)
                                        .updateRegionalInvestment(
                                            currentIndex:
                                                regionInvestments.indexOf(e),
                                            regionalInvestment: response.data);
                                  });
                            }));
                          },
                        ),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.delete, size: 20),
                          onPressed: () {
                            // if id is not null, it means that it exists in the server
                            if (e.id != null) {
                              ref
                                  .read(projectRepositoryProvider)
                                  .removeRegionalInvestment(e.id!);
                            }

                            //
                            ref
                                .read(fullProjectControllerProvider(widget.uuid)
                                    .notifier)
                                .removeRegionalInvestment(
                                  index: regionInvestments.indexOf(e),
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('GRAND TOTAL'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2022),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2023),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2024),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2025),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2026),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2027),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2028),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.y2029),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.regionalInvestmentTotalRow.grandTotal),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialTable(FullProject project, FormOptions options) {
    final List<FsInvestment> fsInvestments = project.fsInvestments;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border:
            TableBorder.all(color: Theme.of(context).primaryColor, width: 0.5),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          const TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('FUNDING SOURCE'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2022 & Prior',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2023',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2024',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2025',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2026',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2027',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2028',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2029 & Beyond',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'TOTAL',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'ACTIONS',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          ...fsInvestments.map((e) {
            return TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.fundingSource?.label ?? 'N/A'),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2022.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2022),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2023.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2023),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2024.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2024),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2025.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2025),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2026.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2026),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2027.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2027),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2028.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2028),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: e.y2029.toString()))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Value copied to clipboard")));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ref.watch(numberFormatterProvider).format(e.y2029),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.total),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            visualDensity: VisualDensity.compact,
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return FsInvestmentEditor(
                                    project: project,
                                    oldValue: e,
                                    options: options.fundingSources ?? [],
                                    onSubmit: (newValue) async {
                                      final response = await ref
                                          .read(projectRepositoryProvider)
                                          .updateFsInvestment(
                                              widget.uuid, newValue);
                                      //
                                      ref
                                          .read(fullProjectControllerProvider(
                                                  widget.uuid)
                                              .notifier)
                                          .updateFsInvestment(
                                              index: fsInvestments.indexOf(e),
                                              fsInvestment: response.data);
                                    });
                              }));
                            }),
                        IconButton(
                            visualDensity: VisualDensity.compact,
                            icon: const Icon(Icons.delete, size: 20),
                            onPressed: () {
                              if (e.id != null) {
                                ref
                                    .read(projectRepositoryProvider)
                                    .removeFsInvestment(e.id!);
                              }

                              int index = fsInvestments.indexOf(e);

                              ref
                                  .read(
                                      fullProjectControllerProvider(widget.uuid)
                                          .notifier)
                                  .removeFsInvestment(index: index);
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('GRAND TOTAL'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2022),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2023),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2024),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2025),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2026),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2027),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2028),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.y2029),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(project.fsInvestmentTotalRow.grandTotal),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialAccomplishments(project) {
    final FinancialAccomplishment financialAccomplishment =
        project.financialAccomplishment ?? FinancialAccomplishment.initial();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(
          color: Theme.of(context).primaryColor,
          width: 0.5,
        ),
        children: [
          const TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Year'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'National Expenditure Program',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'General Appropriations Act',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Actual Disbursement',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Actions',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2023'),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.nep2023.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.nep2023),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.gaa2023.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.gaa2023),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.disbursement2023
                                .toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.disbursement2023),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FinancialAccomplishmentForm(
                            project: project,
                            year: 2023,
                            nep: financialAccomplishment.nep2023 ?? 0,
                            gaa: financialAccomplishment.gaa2023 ?? 0,
                            disbursement:
                                financialAccomplishment.disbursement2023 ?? 0,
                          );
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2024'),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.nep2024.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.nep2024),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.gaa2024.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.gaa2024),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.disbursement2024
                                .toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.disbursement2024),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FinancialAccomplishmentForm(
                            project: project,
                            year: 2024,
                            nep: financialAccomplishment.nep2024 ?? 0,
                            gaa: financialAccomplishment.gaa2024 ?? 0,
                            disbursement:
                                financialAccomplishment.disbursement2024 ?? 0,
                          );
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2025'),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.nep2025.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.nep2025),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.gaa2025.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.gaa2025),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.disbursement2025
                                .toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.disbursement2025),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FinancialAccomplishmentForm(
                            project: project,
                            year: 2025,
                            nep: financialAccomplishment.nep2025 ?? 0,
                            gaa: financialAccomplishment.gaa2025 ?? 0,
                            disbursement:
                                financialAccomplishment.disbursement2025 ?? 0,
                          );
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2026'),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.nep2026.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.nep2026),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.gaa2026.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.gaa2026),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.disbursement2026
                                .toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.disbursement2026),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FinancialAccomplishmentForm(
                            project: project,
                            year: 2026,
                            nep: financialAccomplishment.nep2026 ?? 0,
                            gaa: financialAccomplishment.gaa2026 ?? 0,
                            disbursement:
                                financialAccomplishment.disbursement2026 ?? 0,
                          );
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2027'),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.nep2027.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.nep2027),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.gaa2027.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.gaa2027),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.disbursement2027
                                .toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.disbursement2027),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FinancialAccomplishmentForm(
                            project: project,
                            year: 2027,
                            nep: financialAccomplishment.nep2027 ?? 0,
                            gaa: financialAccomplishment.gaa2027 ?? 0,
                            disbursement:
                                financialAccomplishment.disbursement2027 ?? 0,
                          );
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2028'),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.nep2028.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.nep2028),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.gaa2028.toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.gaa2028),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                            text: financialAccomplishment.disbursement2028
                                .toString()))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Value copied to clipboard")));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref
                          .watch(numberFormatterProvider)
                          .format(financialAccomplishment.disbursement2028),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FinancialAccomplishmentForm(
                            project: project,
                            year: 2028,
                            nep: financialAccomplishment.nep2028 ?? 0,
                            gaa: financialAccomplishment.gaa2028 ?? 0,
                            disbursement:
                                financialAccomplishment.disbursement2028 ?? 0,
                          );
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Totals Row
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Total'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.nepTotal),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.gaaTotal),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.disbursementTotal),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddRegion(project) {
    final regionsCount =
        ref.watch(optionsControllerProvider).value?.data.regions?.length ?? 0;
    final regionalInvestmentsCount = project.regionalInvestments.length;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: TextButton(
              onPressed: regionsCount > regionalInvestmentsCount
                  ? () {
                      //
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        //
                        return RegionalInvestmentEditor(
                            project: project,
                            options: ref
                                    .watch(optionsControllerProvider)
                                    .value
                                    ?.data
                                    .regions ??
                                [],
                            oldValue: RegionalInvestment.initial(
                                projectId: project.id),
                            onSubmit: (newValue) {
                              ref
                                  .read(projectRepositoryProvider)
                                  .updateRegionalInvestment(
                                      widget.uuid, newValue);
                              //
                              ref
                                  .read(
                                      fullProjectControllerProvider(widget.uuid)
                                          .notifier)
                                  .addRegionalInvestment(
                                      regionalInvestment: newValue);

                              // close the editor
                              Navigator.of(context).pop();
                            });
                      }));
                    }
                  : null,
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddFs(FullProject project, FormOptions options) {
    final fsCount = ref
            .watch(optionsControllerProvider)
            .value
            ?.data
            .fundingSources
            ?.length ??
        0;
    final fsInvestmentsCount = project.fsInvestments.length;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: TextButton(
              onPressed: fsCount > fsInvestmentsCount
                  ? () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return FsInvestmentEditor(
                            project: project,
                            oldValue:
                                FsInvestment.initial(projectId: project.id),
                            options: options.fundingSources ?? [],
                            onSubmit: (newValue) {
                              ref
                                  .read(projectRepositoryProvider)
                                  .updateFsInvestment(widget.uuid, newValue);
                              //
                              ref
                                  .read(
                                      fullProjectControllerProvider(widget.uuid)
                                          .notifier)
                                  .addFsInvestment(fsInvestment: newValue);

                              // close the editor
                              Navigator.of(context).pop();
                            });
                      }));
                    }
                  : null,
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
