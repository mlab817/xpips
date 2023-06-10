import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../widgets/papform/form_objects/attachments.dart';
import '../widgets/papform/common/checkboxeditor.dart';
import '../../application/app_router.dart';
import '../../application/extensions.dart';
import '../../application/providers/numberformatter_provider.dart';
import '../../data/repositories/repositories.dart';
import '../../data/requests/requests.dart';
import '../../data/responses/responses.dart';
import '../../domain/models/models.dart';
import '../../presentation/controllers/controllers.dart';
import '../../presentation/widgets/message_bubble.dart';
import '../widgets/papform/common/SwitchEditor.dart';
import '../widgets/papform/common/dateeditor.dart';
import '../widgets/papform/common/radioeditor.dart';
import '../widgets/papform/common/sliverstickyheader.dart';
import '../widgets/papform/common/texteditor.dart';
import '../widgets/papform/financial_accomplishment.dart';
import '../widgets/papform/form_objects/officeeditor.dart';
import '../widgets/papform/form_objects/total_project_cost.dart';

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
  bool _isExpanded = false;

  final TextEditingController _textEditingController = TextEditingController();
  final Random _random = Random();

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final projectProfileAsync = ref.watch(projectProvider(uuid: widget.uuid));

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
              //
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
            tooltip: 'Delete',
          ),
        ],
      ),
      floatingActionButton: !_isExpanded ? _buildChatBadge() : null,
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
          // chat box
          _buildChat(),
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
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: const Icon(Icons.chat_bubble),
        ),
      );
    }, error: (error, stacktrace) {
      return Container();
    }, loading: () {
      return Container();
    });
  }

  Widget _buildShow(ProjectResponse response) {
    final FullProject project =
        ref.watch(fullProjectControllerProvider(widget.uuid));

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        // General Information
        SliverStickyHeader(
          header:
              const SliverStickyHeaderComponent(title: 'General Information'),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                TextEditor(
                  project: project,
                  fieldLabel: 'Title',
                  oldValue: project.title ?? '',
                  onSubmit: (String newValue) {
                    //
                    final Map<String, dynamic> payload = {
                      'title': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(project.uuid)
                            .notifier)
                        .update(title: newValue);

                    // close
                    Navigator.pop(context);
                  },
                ),
                RadioEditor(
                    project: project,
                    fieldLabel: 'Program or Project',
                    oldValue: project.type,
                    onSubmit: (newValue) {
                      // TODO: implement TYpe update
                    },
                    options: ref
                            .watch(optionsControllerProvider)
                            .value
                            ?.data
                            .types ??
                        []),
                SwitchEditor(
                  project: project,
                  fieldLabel: 'Regular Program',
                  oldValue: project.regularProgram ?? false,
                  onSubmit: (bool value) {
                    final Map<String, dynamic> payload = {
                      'regular_program': value,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(project.uuid)
                            .notifier)
                        .update(regularProgram: value);

                    // close
                    Navigator.pop(context);
                  },
                ),
                CheckboxEditor(
                  project: project,
                  fieldLabel: 'Basis for Implementation',
                  options:
                      ref.watch(optionsControllerProvider).value?.data.bases ??
                          [],
                  oldValue: ref
                      .watch(fullProjectControllerProvider(project.uuid))
                      .bases,
                  onSubmit: (List<Option> newValue) {
                    final valueToSubmit = newValue.map((e) => e.value).toList();

                    final payload = {
                      'bases': valueToSubmit,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: project.uuid ?? '', payload: payload);

                    ref
                        .watch(fullProjectControllerProvider(project.uuid)
                            .notifier)
                        .update(bases: newValue);

                    Navigator.pop(context);
                  },
                ),
                TextEditor(
                  project: project,
                  fieldLabel: 'Description',
                  oldValue: project.description ?? '',
                  onSubmit: (String newValue) {
                    //
                    final Map<String, dynamic> payload = {
                      'description': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(project.uuid)
                            .notifier)
                        .update(description: newValue);

                    // close
                    Navigator.pop(context);
                  },
                ),
                TotalProjectCost(project: project),
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
                onSubmit: (Office newValue) {
                  //
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
                  onSubmit: (newValue) {
                    // TODO: update logic
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
                onSubmit: (newValue) {
                  // TODO: spatial coverage
                },
              ),
              ListTile(
                subtitle: Text(
                  project.locations.map((e) => e.label).join(', '),
                ),
                title: const Text('Regions/Provinces'),
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
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'iccable': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(iccable: value);

                  // close
                  Navigator.pop(context);
                },
              ),
              RadioEditor(
                project: project,
                fieldLabel: 'Approval Level',
                oldValue: project.approvalLevel,
                onSubmit: (newValue) {},
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
                  onSubmit: (newValue) {}),
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
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'pip': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(pip: value);

                  // close
                  Navigator.pop(context);
                },
              ),
              RadioEditor(
                  project: project,
                  fieldLabel: 'Typology of PIP',
                  oldValue: project.typology,
                  onSubmit: (newValue) {
                    // TODO: implement CIP TYpe update
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
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'cip': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(cip: value);

                  // close
                  Navigator.pop(context);
                },
              ),
              RadioEditor(
                  project: project,
                  fieldLabel: 'Type of CIP',
                  oldValue: project.cipType,
                  onSubmit: (newValue) {
                    // TODO: implement CIP TYpe update
                  },
                  options: ref
                          .watch(optionsControllerProvider)
                          .value
                          ?.data
                          .cipTypes ??
                      []),
              SwitchEditor(
                project: project,
                fieldLabel: 'Core Investment Programs/Projects (CIP)',
                oldValue: project.trip ?? false,
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'trip': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(trip: value);

                  // close
                  Navigator.pop(context);
                },
              ),
              SwitchEditor(
                project: project,
                fieldLabel: 'Is it a Research and Development Program/Project?',
                oldValue: project.research ?? false,
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'research': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(research: value);

                  // close
                  Navigator.pop(context);
                },
              ),
              SwitchEditor(
                project: project,
                fieldLabel:
                    'Is it responsive to COVID-19/New Normal Intervention?',
                oldValue: project.covid ?? false,
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'covid': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(covid: value);

                  // close
                  Navigator.pop(context);
                },
              ),
              SwitchEditor(
                project: project,
                fieldLabel: 'Is the Program/Project included in the RDIP?',
                oldValue: project.rdip ?? false,
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'rdip': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(rdip: value);

                  // close
                  Navigator.pop(context);
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
                  onSubmit: (newValue) {
                    //
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
                  onSubmit: (newValue) {
                    //
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
              // TODO: Nested Checkbox
              ListTile(
                title: const Text(
                  'Main Infrastructure Sector/Subsector',
                ),
                subtitle: Text(
                  project.infrastructureSectors.map((e) => e.label).join(', '),
                ),
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
                  onSubmit: (newValue) {}),
              TextEditor(
                project: project,
                fieldLabel: 'Implementation Risks and Mitigation Strategies',
                oldValue: project.risk ?? 'NO DATA',
                onSubmit: (String newValue) {
                  //
                  final Map<String, dynamic> payload = {
                    'implementation_risk': newValue,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(risk: newValue);

                  // close
                  Navigator.pop(context);
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
                  oldValue: project.expectedOutputs ?? '',
                  onSubmit: (String newValue) {
                    final Map<String, dynamic> payload = {
                      'expected_outputs': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(project.uuid)
                            .notifier)
                        .update(expectedOutputs: newValue);

                    // close
                    Navigator.pop(context);
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
                  oldValue: project.sdgs,
                  onSubmit: (newValue) {
                    //
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
                  onSubmit: (newValue) {
                    //
                  }),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Level of GAD Responsiveness',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                  project: project,
                  fieldLabel: 'Level of GAD Responsiveness',
                  oldValue: project.gad,
                  onSubmit: (newValue) {
                    // TODO: implement GAD update
                  },
                  options:
                      ref.watch(optionsControllerProvider).value?.data.gads ??
                          []),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Project Preparation Details',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // TODO: add fields
              // FS details
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Pre-construction Costs',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // TODO: add fields
              // ROWA
              // RAP
              // ROWA/RAP
            ]),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Employment Generation',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // TODO: add fields
              // ROWA
              // RAP
              // ROWA/RAP
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
                onSubmit: (newValue) {
                  // TODO: implement Funding Sources
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
                          .fundingSources ??
                      [],
                  oldValue: project.fundingSources,
                  onSubmit: (newValue) {
                    //
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
                  onSubmit: (newValue) {
                    //
                  }),
              RadioEditor(
                project: project,
                fieldLabel: 'Mode of Implementation/Procurement',
                oldValue: project.implementationMode,
                onSubmit: (newValue) {
                  // TODO: implement Funding Sources
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
                _buildFinancialTable(project),
                _buildAddFs(project),
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
                _buildRegionalTable(project),
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
                onSubmit: (newValue) {
                  // TODO: implement Category
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
                onSubmit: (newValue) {},
                options: ref
                        .watch(optionsControllerProvider)
                        .value
                        ?.data
                        .projectStatuses ??
                    [],
              ),
              SwitchEditor(
                project: project,
                fieldLabel: 'Will require resubmission to the ICC?',
                oldValue: project.iccResubmission ?? false,
                onSubmit: (bool value) {
                  final Map<String, dynamic> payload = {
                    'icc_resubmission': value,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(iccResubmission: value);

                  // close
                  Navigator.pop(context);
                },
              ),
              TextEditor(
                project: project,
                fieldLabel: 'Updates',
                oldValue: project.updates ?? 'NO DATA',
                onSubmit: (String newValue) {
                  //
                  final Map<String, dynamic> payload = {
                    'updates': newValue,
                  };

                  ref
                      .read(patchProjectControllerProvider.notifier)
                      .submit(uuid: project.uuid!, payload: payload);

                  // update the provider
                  ref
                      .read(
                          fullProjectControllerProvider(project.uuid).notifier)
                      .update(updates: newValue);

                  // close
                  Navigator.pop(context);
                },
              ),
              DateEditor(
                  project: project,
                  fieldLabel: 'As of',
                  oldValue: project.asOf,
                  onSubmit: (newValue) {
                    //
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
                onSubmit: (newValue) {
                  // TODO: implement Funding Sources
                },
                options:
                    ref.watch(optionsControllerProvider).value?.data.years ??
                        [],
              ),
              RadioEditor(
                project: project,
                fieldLabel: 'Year of Project Completion',
                oldValue: project.endYear,
                onSubmit: (newValue) {
                  // TODO: implement Funding Sources
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
                  onSubmit: (String newValue) {
                    //
                    final Map<String, dynamic> payload = {
                      'contact_information': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(project.uuid)
                            .notifier)
                        .update(contactInformation: newValue);

                    // close
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: const SliverStickyHeaderComponent(
            title: 'Attachments',
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              if (project.uuid != null) Attachments(uuid: project.uuid!),
            ]),
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
                  onSubmit: (String newValue) {
                    //
                    final Map<String, dynamic> payload = {
                      'notes': newValue,
                    };

                    ref
                        .read(patchProjectControllerProvider.notifier)
                        .submit(uuid: project.uuid!, payload: payload);

                    // update the provider
                    ref
                        .read(fullProjectControllerProvider(project.uuid)
                            .notifier)
                        .update(notes: newValue);

                    // close
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegionalTable(FullProject project) {
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
                          onPressed: () {},
                        ),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.delete, size: 20),
                          onPressed: () {
                            //
                            ref
                                .read(
                                    fullProjectControllerProvider(project.uuid)
                                        .notifier)
                                .removeRegionalInvestment(
                                  regionalInvestment: e,
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

  Widget _buildFinancialTable(FullProject project) {
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
                              // TODO: implement edit
                            }),
                        IconButton(
                            visualDensity: VisualDensity.compact,
                            icon: const Icon(Icons.delete, size: 20),
                            onPressed: () {
                              // TODO: implement delete
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
    final FinancialAccomplishment? financialAccomplishment =
        project.financialAccomplishment;

    if (financialAccomplishment == null) {
      return Container();
    }

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
                            text: financialAccomplishment.nep2023.toString() ??
                                ''))
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

  Widget _buildChat() {
    final liveComments = ref.watch(combinedCommentsProvider(uuid: widget.uuid));

    print('live comments length: ');

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      right: _isExpanded ? 0 : -368,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 600,
            maxHeight: 600,
            minWidth: 300,
            maxWidth: 360,
          ),
          child: Container(
            height: 600,
            width: 360,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Comments'),
                      const Spacer(),
                      IconButton(
                        onPressed: _toggleExpanded,
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: liveComments.when(
                    data: (data) {
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final comment = data[index];

                          return MessageBubble(comment: comment);
                        },
                      );
                    },
                    error: (error, stacktrace) {
                      return Center(
                        child: Text('Error: ${error.toString()}'),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 1,
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.send),
                    ),
                    onFieldSubmitted: (String? value) {
                      debugPrint(value);
                      if (value == null) {
                        return;
                      }
                      //

                      ref
                          .read(newCommentRepositoryProvider(uuid: widget.uuid))
                          .addComment(CommentRequest(comment: value));

                      ref
                          .read(newCommentLocalStreamControllerProvider)
                          .sink
                          .add(Comment(
                            id: 6000000 + _random.nextInt(100),
                            comment: value,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                            isResolved: false,
                            userId: ref.watch(currentUserProvider)?.id,
                            user: ref
                                .watch(currentUserProvider)
                                ?.toQuickResource(),
                          ));

                      _textEditingController.clear();
                    },
                  ),
                ),
                // Add more chat messages as needed
              ],
            ),
          ),
        ),
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
                      ref
                          .read(fullProjectControllerProvider(project.uuid)
                              .notifier)
                          .addRegionalInvestment(
                              regionalInvestment: RegionalInvestment.initial());
                    }
                  : null,
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddFs(project) {
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
                      // TODO: implement navigator
                      ref
                          .read(fullProjectControllerProvider(project.uuid)
                              .notifier)
                          .addFsInvestment(
                              fsInvestment: FsInvestment.initial());
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
