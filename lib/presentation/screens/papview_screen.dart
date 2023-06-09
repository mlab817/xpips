import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';

import '../../application/app_router.dart';
import '../../application/extensions.dart';
import '../../application/providers/numberformatter_provider.dart';
import '../../data/repositories/repositories.dart';
import '../../data/requests/requests.dart';
import '../../data/responses/responses.dart';
import '../../domain/models/models.dart';
import '../../presentation/controllers/currentuser_controller.dart';
import '../../presentation/controllers/newcommentstream_controller.dart';
import '../../presentation/widgets/message_bubble.dart';
import '../../presentation/widgets/papform/form_objects/update_notes.dart';
import '../controllers/combinedcomments_controller.dart';
import '../controllers/controllers.dart';
import '../controllers/patchproject_controller.dart';
import '../widgets/papform/common/radioeditor.dart';
import '../widgets/papform/common/texteditor.dart';
import '../widgets/papform/form_objects/financial_accomplishment.dart';
import '../widgets/papform/form_objects/total_project_cost.dart';
import '../widgets/papform/form_objects/update_indicator.dart';
import '../widgets/papform/form_objects/update_pap.dart';

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
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'General Information',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
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
                UpdatePap(project: project),
                RadioEditor(
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
                ListTile(
                  subtitle: Text(
                    project.bases.map((e) => e.label).join(', '),
                  ),
                  title: const Text('Basis for Implementation'),
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
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Implementing Offices/Units',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                subtitle: Text(project.office?.name ?? 'N/A'),
                title: const Text('Office'),
              ),
              ListTile(
                subtitle: Text(
                  project.operatingUnits.map((e) => e.label).join(', '),
                ),
                title: const Text('Implementing Units'),
              ),
            ]),
          ),
        ),
        // Spatial Coverage
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Spatial Coverage',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                subtitle: Text(project.spatialCoverage?.label ?? 'N/A'),
                title: const Text('Spatial Coverage'),
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
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Level of Approval',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
                project: project,
                fieldLabel: 'Requires ICC submission',
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
              ListTile(
                subtitle: Text(project.approvalLevel?.label ?? 'N/A'),
                title: const Text('Approval Level'),
              ),
              ListTile(
                subtitle: Text(project.approvalLevelDate != null
                    ? DateFormat.yMMMd().format(project.approvalLevelDate!)
                    : 'N/A'),
                title: const Text('As of'),
              ),
            ]),
          ),
        ),
        // Project for Inclusion in Which Programming Document
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Project for Inclusion in Which Programming Document',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              RadioEditor(
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
              ListTile(
                subtitle: Text(project.typology?.label ?? 'N/A'),
                title: const Text('Typology of PIP'),
              ),
              RadioEditor(
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
              ListTile(
                subtitle: Text(project.cipType?.label ?? 'N/A'),
                title: const Text('Type of CIP'),
              ),
              RadioEditor(
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
              RadioEditor(
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
              RadioEditor(
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
              RadioEditor(
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
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Philippine Development Plan (PDP) Chapter',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  subtitle: Text(project.pdpChapter?.label ?? 'N/A'),
                  title:
                      const Text('Philippine Development Plan (PDP) Chapter'),
                ),
                ListTile(
                  subtitle: Text(
                    project.pdpChapters.map((e) => e.label).join(', '),
                  ),
                  title: const Text(
                      'Other Philippine Development Plan (PDP) Chapter/s'),
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Main Infrastructure Sector/Subsector',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Main Infrastructure Sector/Subsector',
                ),
                subtitle: Text(
                  project.infrastructureSectors.map((e) => e.label).join(', '),
                ),
              ),
              ListTile(
                title: const Text(
                  'Prerequisites',
                ),
                subtitle: Text(
                  project.prerequisites.map((e) => e.label).join(', '),
                ),
              ),
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
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Expected Outputs/Deliverables',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              UpdateIndicator(project: project),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              '8-Point Socioeconomic Agenda',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  '8-Point Socioeconomic Agenda',
                ),
                subtitle: Text(
                  project.agenda.map((e) => e.label).join(', '),
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Sustainable Development Goals',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Sustainable Development Goals',
                ),
                subtitle: Text(
                  project.sdgs.map((e) => e.label).join(', '),
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Level of GAD Responsiveness',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Level of GAD Responsiveness',
                ),
                subtitle: Text(
                  project.gad?.label ?? 'N/A',
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Funding Source and Mode of Implementation',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Main Funding Source',
                ),
                subtitle: Text(
                  project.fundingSource?.label ?? 'N/A',
                ),
              ),
              ListTile(
                title: const Text(
                  'Funding Sources',
                ),
                subtitle: Text(
                  project.fundingSources.map((e) => e.label).join(', '),
                ),
              ),
              ListTile(
                title: const Text(
                  'Funding Institutions',
                ),
                subtitle: Text(
                  project.fundingInstitutions.map((e) => e.label).join(', '),
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Physical and Financial Status',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Category',
                ),
                subtitle: Text(
                  project.category?.label ?? 'N/A',
                ),
              ),
              ListTile(
                title: const Text(
                  'Status of Implementation Readiness',
                ),
                subtitle: Text(
                  project.projectStatus?.label ?? 'N/A',
                ),
              ),
              RadioEditor(
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
              ListTile(
                title: const Text('As of'),
                subtitle: Text(project.asOf != null
                    ? DateFormat.yMMMd().format(project.asOf!)
                    : 'N/A'),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Implementation Period',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text('Start of Project Implementation'),
                subtitle: Text(project.startYear?.label ?? 'N/A'),
              ),
              ListTile(
                title: const Text('Year of Project Completion'),
                subtitle: Text(project.endYear?.label ?? 'N/A'),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Investment Cost per Region',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildRegionalTable(project),
                // TODO: only enable if current regions < all regions
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          child: const Text('Add'),
                          onPressed: () {
                            //
                            ref
                                .read(
                                    fullProjectControllerProvider(project.uuid)
                                        .notifier)
                                .addRegionalInvestment(
                                    regionalInvestment:
                                        RegionalInvestment.initial());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Investment Cost per Funding Source',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildFinancialTable(project),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          child: const Text('Add'),
                          onPressed: () {
                            // TODO: implement navigator
                            ref
                                .read(
                                    fullProjectControllerProvider(project.uuid)
                                        .notifier)
                                .addFsInvestment(
                                    fsInvestment: FsInvestment.initial());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Financial Accomplishments',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildFinancialAccomplishments(project),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Contact Information',
              style: TextStyle(color: Colors.white),
            ),
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
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Attachments',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              UpdateNotes(project: project),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Notes',
              style: TextStyle(color: Colors.white),
            ),
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
                              ClipboardData(text: e.y2027.toString() ?? ''))
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
                              ClipboardData(text: e.y2028.toString() ?? ''))
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
}
