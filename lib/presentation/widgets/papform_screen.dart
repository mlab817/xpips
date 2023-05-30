import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pips/presentation/controllers/fullproject_controller.dart';
import 'package:pips/presentation/controllers/options_controller.dart';
import 'package:pips/presentation/widgets/papform/form_objects/employment.dart';
import 'package:pips/presentation/widgets/papform/form_objects/funding_source_implementation.dart';
import 'package:pips/presentation/widgets/papform/form_objects/implementation_basis.dart';
import 'package:pips/presentation/widgets/papform/form_objects/row.dart';
import 'package:pips/presentation/widgets/papform/form_objects/total_project_cost.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_office.dart';

import '../../data/requests/fullproject_request.dart';
import '../../domain/models/option.dart';
import 'papform/empty_indicator.dart';
import 'papform/form_objects/physical_status.dart';
import 'papform/form_objects/update_description.dart';
import 'papform/form_objects/update_financial_accomplishment.dart';
import 'papform/form_objects/update_fs_cost.dart';
import 'papform/form_objects/update_infra_sectors.dart';
import 'papform/form_objects/update_investment_cost.dart';
import 'papform/form_objects/update_pap.dart';
import 'papform/form_objects/update_pip.dart';
import 'papform/form_objects/update_rap.dart';
import 'papform/form_objects/update_regional_cost.dart';
import 'papform/form_objects/update_title.dart';
import 'papform/get_input_decoration.dart';
import 'papform/select_dialog_content.dart';
import 'papform/success_indicator.dart';

enum Status {
  error,
  success,
  neutral,
}

class PapForm extends ConsumerStatefulWidget {
  const PapForm({Key? key, this.uuid}) : super(key: key);

  final String? uuid;

  @override
  ConsumerState<PapForm> createState() => _PapForm();
}

class _PapForm extends ConsumerState<PapForm> {
  late ScrollController _scrollController;

  // for reviewers use only

  // focus nodes
  final FocusNode _expectedOutputNode = FocusNode();
  final FocusNode _riskNode = FocusNode();
  final FocusNode _remarkNode = FocusNode();
  final FocusNode _papCodeNode = FocusNode();
  final FocusNode _commentNode = FocusNode();
  final FocusNode _notesNode = FocusNode();

  // monitor scroll position
  double _scrollPercentage = 0;

  // show radio to select office

  Future<void> _selectOus() async {
    final operatingUnits = ref.watch(
        fullProjectControllerProvider.select((value) => value.operatingUnits));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option> selected = operatingUnits;

          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Operating Units'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.operatingUnits ?? [],
                    multiple: true,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (err, stackTrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(operatingUnits: response);
  }

  Future<void> _selectPdpChapter() async {
    final pdpChapter = ref.watch(
        fullProjectControllerProvider.select((value) => value.pdpChapter));
    final optionsAsync = ref.watch(optionsControllerProvider);

    //
    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = pdpChapter;

          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Main PDP Chapter'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.pdpChapters ?? [],
                    selected: selected,
                    multiple: false,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(pdpChapter: response);
  }

  Future<void> _selectPdpChapters() async {
    final pdpChapters = ref.watch(
        fullProjectControllerProvider.select((value) => value.pdpChapters));
    final optionsAsync = ref.watch(optionsControllerProvider);

    //
    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option> selected = pdpChapters;

          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Other PDP Chapters'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.pdpChapters ?? [],
                    multiple: true,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(
                onUpdate: () {
                  Navigator.pop(context, selected);
                },
              ),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(pdpChapters: response);
  }

  Future<void> _selectSdgs() async {
    final sdgs =
        ref.watch(fullProjectControllerProvider.select((value) => value.sdgs));
    final optionsAsync = ref.watch(optionsControllerProvider);

    //
    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option> selected = sdgs;

          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Sustainable Development Goals'),
            content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.sdgs ?? [],
                  multiple: true,
                  selected: selected,
                  onChanged: (value) {
                    selected = value;
                  },
                );
              },
              error: (err, stack) {
                return Container();
              },
              loading: () => const CircularProgressIndicator(),
            ),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref.read(fullProjectControllerProvider.notifier).update(sdgs: response);
  }

  // listen to and update scroll position
  void _updateScrollPercentage() {
    double maxHeight = _scrollController.position.maxScrollExtent;
    double currentPosition = _scrollController.position.pixels;

    setState(() {
      _scrollPercentage = currentPosition / maxHeight;
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(_updateScrollPercentage);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const Text('General Information'),
      const UpdateTitle(),
      const UpdatePap(),
      const RegularProgram(),
      const ImplementationBasis(),
      const UpdateDescription(),
      const TotalProjectCost(),
      const Divider(),
      // office
      const Text('Implementers'),
      const UpdateOffice(),
      _buildOus(),
      const Divider(),
      _buildSpatialCoverage(),
      _buildLocations(),
      const Divider(),
      const UpdatePip(),
      _buildTypology(),
      _buildCip(),
      _buildCipType(),
      _buildTrip(),
      _buildRdip(),
      _buildResearch(),
      _buildCovid(),
      const Divider(),
      _buildIccable(),
      _buildApprovalLevel(),
      _buildApprovalLevelDate(),
      const Divider(),
      _buildPdpChapter(),
      _buildPdpChapters(),
      _buildExpectedOutputs(),
      const Divider(),
      const UpdateInfraSectors(),
      _buildPrerequisites(),
      _buildRisk(),
      const Divider(),
      _buildAgenda(),
      const Divider(),
      _buildSdgs(),
      const Divider(),
      _buildGad(),
      const Divider(),
      _buildPreparationDocument(),
      _buildFsStatus(),
      _buildNeedFsAssistance(),
      const UpdateFsCost(),
      _buildFsCompletionDate(),
      const Divider(),
      const UpdateRow(),
      const Divider(),
      const UpdateRap(),
      const Divider(),
      _buildRowRap(),
      const Divider(),
      const EmploymentGenerated(),
      const Divider(),
      const Text('Funding Source and Mode of Implementation'),
      const UpdateFundingSourceAndImplementation(),
      const Divider(),
      const UpdateRegionalCost(),
      const Divider(),
      const UpdateInvestmentCost(),
      const Divider(),
      PhysicalStatus(),
      const Divider(),
      _buildPureGrant(),
      _buildPapCode(),
      const UpdateFinancialAccomplishment(),
      const Divider(),
      _buildRemarks(),
      const Divider(),
      _buildComments(),
    ];

    return Column(
      children: [
        // TODO: Update to form progress
        LinearProgressIndicator(
          value: _scrollPercentage,
        ),
        Expanded(
          // update if linear progress indicator resizes
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOus() {
    final operatingUnits = ref.watch(
        fullProjectControllerProvider.select((value) => value.operatingUnits));

    return ListTile(
      title: const Text('Operating Units'),
      subtitle: operatingUnits.isNotEmpty
          ? Text(operatingUnits.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: operatingUnits.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectOus,
    );
  }

  Widget _buildSpatialCoverage() {
    final spatialCoverage = ref.watch(
        fullProjectControllerProvider.select((value) => value.spatialCoverage));

    return ListTile(
      title: const Text('Spatial Coverage'),
      subtitle: spatialCoverage != null
          ? Text(spatialCoverage.label)
          : const Text('Select one'),
      trailing: spatialCoverage != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectSpatialCoverage,
    );
  }

  Future<void> _selectSpatialCoverage() async {
    final spatialCoverage = ref.watch(
        fullProjectControllerProvider.select((value) => value.spatialCoverage));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = spatialCoverage;

          return AlertDialog(
            title: const Text('Spatial Coverage'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.spatialCoverages ?? [],
                    multiple: false,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stacktrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(spatialCoverage: response);
  }

  Widget _buildLocations() {
    final locations = ref.watch(
        fullProjectControllerProvider.select((value) => value.locations));

    return ListTile(
      title: const Text('Regions/Provinces'),
      subtitle: locations.isNotEmpty
          ? Text(locations.map((location) => location.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: locations.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectLocations,
    );
  }

  Future<void> _selectLocations() async {
    final locations = ref.watch(
        fullProjectControllerProvider.select((value) => value.locations));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option>? selected = locations;

          return AlertDialog(
            title: const Text('Regions/Provinces'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.locations ?? [],
                  selected: selected,
                  multiple: true,
                  onChanged: (value) {
                    selected = value;
                  },
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => const CircularProgressIndicator(),
            ),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(locations: response);
  }

  Widget _buildIccable() {
    final cip =
        ref.watch(fullProjectControllerProvider.select((value) => value.cip));
    final iccable = ref
        .watch(fullProjectControllerProvider.select((value) => value.iccable));

    return SwitchListTile(
      title: const Text(
          'Will require Investment Coordination Committee/NEDA Board Approval (ICC-able)?'),
      value: iccable ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(iccable: value);
            }
          : null,
    );
  }

  Widget _buildApprovalLevel() {
    final iccable = ref
        .watch(fullProjectControllerProvider.select((value) => value.iccable));
    final approvalLevel = ref.watch(
        fullProjectControllerProvider.select((value) => value.approvalLevel));

    return ListTile(
      enabled: iccable ?? false,
      title: const Text('Level (Status) of Approval'),
      subtitle: approvalLevel != null
          ? Text(approvalLevel.label)
          : const Text('Select one'),
      trailing: approvalLevel != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectApprovalLevel,
    );
  }

  Future<void> _selectApprovalLevel() async {
    final approvalLevel = ref.watch(
        fullProjectControllerProvider.select((value) => value.approvalLevel));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = approvalLevel;

          return AlertDialog(
            title: const Text('Level (Status) of Approval'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.approvalLevels ?? [],
                    multiple: false,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(approvalLevel: response);
  }

  Widget _buildTypology() {
    final pip =
        ref.watch(fullProjectControllerProvider.select((state) => state.pip));
    final typology = ref
        .watch(fullProjectControllerProvider.select((state) => state.typology));

    return ListTile(
      enabled: pip ?? false,
      title: const Text('Typology'),
      subtitle:
          typology != null ? Text(typology.label) : const Text('Select one'),
      trailing:
          typology != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectTypology,
    );
  }

  Future<void> _selectTypology() async {
    final typology = ref
        .watch(fullProjectControllerProvider.select((state) => state.typology));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = typology;

          return AlertDialog(
            title: const Text('Typology'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.typologies ?? [],
                    multiple: false,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref.read(fullProjectControllerProvider.notifier).update(typology: response);
  }

  Widget _buildCip() {
    // TODO: add a confirmation dialog to check if the PAP meets any of the
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));

    // CIP criteria
    return SwitchListTile(
        value: cip ?? false,
        title: const Text('Core Investment Program/Project'),
        subtitle:
            const Text('// TODO: Explain the requirements to be part of CIP'),
        onChanged: (bool? value) {
          // if user is trying to change config
          _toggleCip(value);
        });
  }

  Future<void> _toggleCip(bool? value) async {
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));

    // check if the user is trying to change the data
    if (value != cip) {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirm'),
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What the f*** are you trying to do?'),
                  Text('For CIPs, make sure you provide the following: '),
                  Text('- Status of NEDA-ICC processing and the as of date'),
                  Text(
                      '- The preparation document and details of Feasibility Study (if applicable)'),
                  Text(
                      '- Pre-investment costs such as Right of Way and Resettlement Action Plan (if applicable)'),
                  Text('- The level of GAD Responsiveness'),
                  Text(
                      '- The number of male and female individuals to be employed'),
                ],
              ),
              actions: [
                _buildCancel(),
                _buildUpdate(onUpdate: () {
                  // push change
                  Navigator.pop(context, value);
                }),
              ],
            );
          });

      // set the iccable to be the same as CIP since
      // CIP tagging requires ICCable
      ref.read(fullProjectControllerProvider.notifier).update(
            cip: value ?? false,
            iccable: value,
          );

      if (value ?? false) {
        _showSnackbar(
            message:
                'PAPs tagged as CIP require ICC/NEDA Board approval. Make sure to provide the type and processing status below.');
      }
    }
  }

  Widget _buildCipType() {
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));
    final cipType = ref
        .watch(fullProjectControllerProvider.select((state) => state.cipType));

    return ListTile(
      enabled: cip ?? false,
      title: const Text('Type of CIP'),
      subtitle:
          cipType != null ? Text(cipType.label) : const Text('Select one'),
      trailing:
          cipType != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: cip ?? false ? _selectCipType : null,
    );
  }

  Future<void> _selectCipType() async {
    final cipType = ref
        .watch(fullProjectControllerProvider.select((state) => state.cipType));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = cipType;

          return AlertDialog(
            title: const Text('Type of CIP'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.cipTypes ?? [],
                    multiple: false,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stacktrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref.read(fullProjectControllerProvider.notifier).update(cipType: response);
  }

  Widget _buildTrip() {
    final trip =
        ref.watch(fullProjectControllerProvider.select((value) => value.trip));

    return SwitchListTile(
        value: trip ?? false,
        title: const Text('Three Year Rolling Infrastructure Program'),
        subtitle:
            const Text('// TODO: Explain the requirements to be part of TRIP'),
        onChanged: (bool? value) {
          ref.read(fullProjectControllerProvider.notifier).update(trip: value);
        });
  }

  Widget _buildRdip() {
    final rdip =
        ref.watch(fullProjectControllerProvider.select((state) => state.rdip));

    return SwitchListTile(
        value: rdip ?? false,
        title: const Text('Regional Development Investment Program'),
        // TODO: Explain the requirements to be part of RDIP
        subtitle: const Text(
            'To facilitate validation, please make sure to upload the relevant RDC endorsement later.'),
        onChanged: (bool? value) {
          ref.read(fullProjectControllerProvider.notifier).update(rdip: value);
        });
    // TODO: require user to attach RDIP
    // For RDIP, the user should only submit two pages, 1 - RDC endorsement / reso
    // and 2 - the relevant page of the RDIP where the PAP is present
  }

  Widget _buildResearch() {
    final research = ref
        .watch(fullProjectControllerProvider.select((state) => state.research));

    return SwitchListTile(
        value: research ?? false,
        title: const Text('Is it a research and development project?'),
        // TODO: Explain the requirements to be part of RDIP
        onChanged: (bool? value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(research: value);
        });
  }

  Widget _buildCovid() {
    final covid =
        ref.watch(fullProjectControllerProvider.select((state) => state.covid));

    return SwitchListTile(
        value: covid ?? false,
        title: const Text('Is it response to COVID-19 pandemic'),
        // TODO: Explain the requirements to be a response of COVID-19
        onChanged: (bool? value) {
          ref.read(fullProjectControllerProvider.notifier).update(covid: value);
        });
  }

  Widget _buildApprovalLevelDate() {
    final iccable = ref
        .watch(fullProjectControllerProvider.select((state) => state.iccable));
    final approvalLevelDate = ref.watch(fullProjectControllerProvider
        .select((state) => state.approvalLevelDate));

    return ListTile(
      enabled: iccable ?? false,
      title: const Text('As of'),
      subtitle: approvalLevelDate != null
          ? Text(DateFormat.yMMMd().format(approvalLevelDate))
          : const Text('Select date'),
      trailing: approvalLevelDate != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      // TODO: update color on success
      onTap: _selectApprovalLevelDate,
    );
  }

  Future<void> _selectApprovalLevelDate() async {
    DateTime? approvalLevelDate = ref.watch(fullProjectControllerProvider
        .select((state) => state.approvalLevelDate));

    final DateTime? response = await showDatePicker(
      context: context,
      initialDate: approvalLevelDate ?? DateTime.now(),
      firstDate: DateTime.utc(2010),
      lastDate: DateTime.now(),
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(approvalLevelDate: response);
  }

  Widget _buildPdpChapter() {
    final pdpChapter = ref.watch(
        fullProjectControllerProvider.select((state) => state.pdpChapter));

    //
    return ListTile(
      title: const Text('Main PDP Chapter'),
      subtitle: pdpChapter != null
          ? Text(pdpChapter.label)
          : const Text('Select one'),
      trailing: pdpChapter != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectPdpChapter,
    );
  }

  Widget _buildPdpChapters() {
    final pdpChapters = ref.watch(
        fullProjectControllerProvider.select((state) => state.pdpChapters));
    //
    return ListTile(
      title: const Text('Other PDP Chapters'),
      subtitle: pdpChapters.isNotEmpty
          ? Text(pdpChapters.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: pdpChapters.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(), // TODO: update color on success
      onTap: _selectPdpChapters,
    );
  }

  Widget _buildExpectedOutputs() {
    final expectedOutputs = ref.watch(
        fullProjectControllerProvider.select((state) => state.expectedOutputs));

    return ListTile(
      title: const Text('Expected Outputs/Deliverables'),
      subtitle: TextFormField(
        focusNode: _expectedOutputNode,
        initialValue: expectedOutputs,
        decoration:
            getTextInputDecoration(hintText: 'Expected Outputs/Deliverables'),
        style: Theme.of(context).textTheme.bodyMedium,
        minLines: 3,
        maxLines: 4,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(expectedOutputs: value);
        },
      ),
      trailing: expectedOutputs != null && expectedOutputs.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        _expectedOutputNode.requestFocus();
      },
    );
  }

  Widget _buildPrerequisites() {
    final trip =
        ref.watch(fullProjectControllerProvider.select((state) => state.trip));
    final prerequisites = ref.watch(
        fullProjectControllerProvider.select((state) => state.prerequisites));

    return ListTile(
      enabled: trip ?? false,
      title: const Text('Status of Implementation Readiness'),
      subtitle: prerequisites.isNotEmpty
          ? Text(prerequisites.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: prerequisites.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectPrerequisites,
    );
  }

  Future<void> _selectPrerequisites() async {
    final prerequisites = ref.watch(
        fullProjectControllerProvider.select((state) => state.prerequisites));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (BuildContext context) {
          List<Option> selected = prerequisites;

          return AlertDialog(
            title: const Text('Status of Implementation Readiness'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.prerequisites ?? [],
                    multiple: true,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stacktrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(onUpdate: () {
                Navigator.pop(context, selected);
              })
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(prerequisites: response);
  }

  Widget _buildRisk() {
    final trip =
        ref.watch(fullProjectControllerProvider.select((value) => value.trip));
    final risk =
        ref.watch(fullProjectControllerProvider.select((value) => value.risk));

    return ListTile(
      enabled: trip ?? false,
      title: const Text('Implementation Risks and Mitigation Strategies'),
      trailing: risk != null && risk.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      subtitle: TextFormField(
          enabled: trip ?? false,
          focusNode: _riskNode,
          initialValue: risk,
          decoration: getTextInputDecoration(
              hintText: 'Implementation Risks and Mitigation Strategies'),
          // isDense: true,
          style: Theme.of(context).textTheme.bodyMedium,
          minLines: 3,
          maxLines: 4,
          onChanged: (String value) {
            ref
                .read(fullProjectControllerProvider.notifier)
                .update(risk: value);
          }),
      onTap: () {
        _riskNode.requestFocus();
      },
    );
  }

  Widget _buildSdgs() {
    final sdgs =
        ref.watch(fullProjectControllerProvider.select((state) => state.sdgs));
    //
    return ListTile(
      title: const Text('Sustainable Development Goals'),
      subtitle: sdgs.isNotEmpty
          ? Text(sdgs.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing:
          sdgs.isNotEmpty ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectSdgs,
    );
  }

  Widget _buildAgenda() {
    final agenda = ref
        .watch(fullProjectControllerProvider.select((state) => state.agenda));
    //
    return ListTile(
      title: const Text('SocioeconomicAgenda'),
      subtitle: agenda.isNotEmpty
          ? Text(agenda.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing:
          agenda.isNotEmpty ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectAgenda,
    );
  }

  Future<void> _selectAgenda() async {
    final agenda = ref
        .watch(fullProjectControllerProvider.select((state) => state.agenda));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          List<Option> selected = agenda;
          //
          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Socioeconomic Agenda'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.agenda ?? [],
                    multiple: true,
                    selected: selected,
                    onChanged: (value) {
                      selected = value;
                    },
                  );
                },
                error: (error, stacktrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(
                onUpdate: () {
                  Navigator.pop(context, selected);
                },
              ),
            ],
          );
        });

    ref.read(fullProjectControllerProvider.notifier).update(agenda: response);
  }

  Widget _buildGad() {
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));
    final gad =
        ref.watch(fullProjectControllerProvider.select((state) => state.gad));

    return ListTile(
      enabled: cip ?? false,
      title: const Text('Level of Gender Responsiveness'),
      subtitle: gad != null ? Text(gad.label) : const Text('Select one'),
      trailing: gad != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectGad,
    );
  }

  Future<void> _selectGad() async {
    final gad =
        ref.watch(fullProjectControllerProvider.select((state) => state.gad));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = gad;

        //
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Level of Gender Responsiveness'),
          content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.gads ?? [],
                  multiple: false,
                  selected: selected,
                  onChanged: (value) {
                    selected = value;
                  },
                );
              },
              error: (error, stacktrace) {
                return Container();
              },
              loading: () => const CircularProgressIndicator()),
          actions: [
            _buildCancel(),
            _buildUpdate(
              onUpdate: () {
                Navigator.pop(context, selected);
              },
            ),
          ],
        );
      },
    );

    ref.read(fullProjectControllerProvider.notifier).update(gad: response);
  }

  Widget _buildPreparationDocument() {
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));
    final preparationDocument = ref.watch(fullProjectControllerProvider
        .select((state) => state.preparationDocument));

    return ListTile(
      enabled: cip ?? false,
      title: const Text('Project Preparation Document'),
      subtitle: preparationDocument != null
          ? Text(preparationDocument.label)
          : const Text('Select one'),
      trailing: preparationDocument != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectPreparationDocument,
    );
  }

  Future<void> _selectPreparationDocument() async {
    final preparationDocument = ref.watch(fullProjectControllerProvider
        .select((state) => state.preparationDocument));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = preparationDocument;

        //
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Project Preparation Document'),
          content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.preparationDocuments ?? [],
                  multiple: false,
                  selected: selected,
                  onChanged: (value) {
                    selected = value;
                  },
                );
              },
              error: (error, stacktrace) {
                return Container();
              },
              loading: () => const CircularProgressIndicator()),
          actions: [
            _buildCancel(),
            _buildUpdate(
              onUpdate: () {
                Navigator.pop(context, selected);
              },
            ),
          ],
        );
      },
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(preparationDocument: response);
  }

  // CIP only
  Widget _buildNeedFsAssistance() {
    final fsNeedsAssistance = ref.watch(fullProjectControllerProvider
        .select((state) => state.fsNeedsAssistance));
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));

    return SwitchListTile(
      value: fsNeedsAssistance ?? false,
      title:
          const Text('Requires assistance in the conduct of Feasibility Study'),
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(fsNeedsAssistance: value);
            }
          : null,
    );
  }

  // CIP only
  Widget _buildFsStatus() {
    final fsStatus = ref
        .watch(fullProjectControllerProvider.select((value) => value.fsStatus));
    final cip =
        ref.watch(fullProjectControllerProvider.select((value) => value.cip));

    return ListTile(
      title: const Text('Status of Feasibility Study'),
      subtitle:
          fsStatus != null ? Text(fsStatus.label) : const Text('Select one'),
      trailing:
          fsStatus != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: cip ?? false ? _selectFsStatus : null,
    );
  }

  Future<void> _selectFsStatus() async {
    final fsStatus = ref
        .watch(fullProjectControllerProvider.select((value) => value.fsStatus));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = fsStatus;

          //
          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Status of Feasibility Study'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                      options: data.data.fsStatuses ?? [],
                      selected: selected,
                      multiple: false,
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                        });
                      });
                },
                error: (error, stacktrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              _buildCancel(),
              _buildUpdate(
                onUpdate: () {
                  Navigator.pop(context, selected);
                },
              ),
            ],
          );
        });

    ref.read(fullProjectControllerProvider.notifier).update(fsStatus: response);
  }

  Widget _buildFsCompletionDate() {
    final fsCompletionDate = ref.watch(fullProjectControllerProvider
        .select((value) => value.fsCompletionDate));
    final preparationDocument = ref.watch(fullProjectControllerProvider
        .select((state) => state.preparationDocument));

    return ListTile(
      title: const Text('F/S Target Completion Date'),
      subtitle: fsCompletionDate != null
          ? Text(DateFormat.yMMMd().format(fsCompletionDate))
          : const Text('Select date'),
      trailing: fsCompletionDate != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: preparationDocument != null && preparationDocument.value == 2
          ? _selectFsCompletionDate
          : null,
    );
  }

  Future<void> _selectFsCompletionDate() async {
    final fsCompletionDate = ref.watch(fullProjectControllerProvider
        .select((state) => state.fsCompletionDate));

    final DateTime? response = await showDatePicker(
      context: context,
      initialDate: fsCompletionDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2028),
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(fsCompletionDate: response);
  }

  // CIP only

  // CIP only

  // CIP only
  Widget _buildRowRap() {
    final hasRowRap = ref.watch(
        fullProjectControllerProvider.select((state) => state.hasRowRap));
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));

    return SwitchListTile(
      title: const Text('With Right and Way and Resettlement Component?'),
      value: hasRowRap ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(hasRowRap: value);
            }
          : null,
    );
  }

  ///
  ///

  ///
  ///

  Widget _buildPapCode() {
    final pureGrant = ref.watch(
        fullProjectControllerProvider.select((state) => state.pureGrant));
    final uacsCode = ref
        .watch(fullProjectControllerProvider.select((state) => state.uacsCode));

    return ListTile(
      enabled: !(pureGrant ?? false),
      title: const Text('PAP/UACS Code'),
      trailing:
          uacsCode != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: () {
        _papCodeNode.requestFocus();
      },
      subtitle: TextFormField(
        enabled: !(pureGrant ?? false),
        focusNode: _papCodeNode,
        // TODO: initial value and onChanged
        initialValue: uacsCode,
        decoration: getTextInputDecoration(hintText: '15-digit PREXC_FPAP_ID'),
        style: Theme.of(context).textTheme.bodyMedium,
        maxLength: 15,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(uacsCode: value);
        },
      ),
    );
  }

  Widget _buildPureGrant() {
    final pureGrant = ref.watch(
        fullProjectControllerProvider.select((state) => state.pureGrant));
    final type =
        ref.watch(fullProjectControllerProvider.select((state) => state.type));

    return SwitchListTile(
      value: pureGrant ?? false,
      title: const Text('This is pure grant.'),
      //
      onChanged: type?.value != 1
          ? (bool? value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(pureGrant: value);
            }
          : null,
    );
  }

  Widget _buildRemarks() {
    return ListTile(
      title: const Text('Remarks (optional)'),
      onTap: () {
        _remarkNode.requestFocus();
      },
      subtitle: TextFormField(
        focusNode: _remarkNode,
        // TODO: initial value and onChanged
        initialValue: ref.watch(
            fullProjectControllerProvider.select((state) => state.remarks)),
        decoration: getTextInputDecoration(hintText: 'Remarks'),
        style: Theme.of(context).textTheme.bodyMedium,
        minLines: 3,
        maxLines: 5,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(remarks: value);
        },
      ),
    );
  }

  Widget _buildComments() {
    return ListTile(
      title: const Text('Comments'),
      onTap: () {
        _commentNode.requestFocus();
      },
      subtitle: TextFormField(
        focusNode: _commentNode,
        // TODO: initial value and onChanged
        decoration: getTextInputDecoration(hintText: 'Comments'),
        style: Theme.of(context).textTheme.bodyMedium,
        minLines: 3,
        maxLines: 5,
      ),
    );
  }

  Widget _buildNotes() {
    return ListTile(
      title: const Text('Notes'),
      onTap: () {
        _notesNode.requestFocus();
      },
      subtitle: TextFormField(
        focusNode: _notesNode,
        // TODO: initial value and onChanged
        decoration: getTextInputDecoration(hintText: 'Notes'),
        style: Theme.of(context).textTheme.bodyMedium,
        minLines: 3,
        maxLines: 5,
      ),
    );
  }

  void _dismissDialog() {
    Navigator.pop(context);
  }

  Widget _buildCancel() {
    return TextButton(
      onPressed: _dismissDialog,
      child: const Text('Cancel'),
    );
  }

  Widget _buildUpdate({required Function onUpdate}) {
    return FilledButton(
      onPressed: () {
        onUpdate();
      },
      child: const Text('Update'),
    );
  }

  // show a snackbar for the given message
  void _showSnackbar(
      {required String message, Status status = Status.neutral}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            status == Status.error ? Colors.red[800] : Colors.green[800],
      ),
    );
  }

  // clear CIP related fields
  void _clearCipFields() {
    ref.read(fullProjectControllerProvider.notifier).update(
          iccable: false,
          cipType: null,
          approvalLevel: null,
          approvalLevelDate: null,
          gad: null,
        );
  }
}

class RegularProgram extends ConsumerWidget {
  const RegularProgram({
    super.key,
    this.uuid,
  });

  final String? uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: ref.watch(fullProjectControllerProvider).regularProgram ?? false,
      onChanged: ref.watch(fullProjectControllerProvider).type?.value == 1
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(regularProgram: value);
            }
          : null,
      title: const Text('Regular Program'),
      subtitle: const Text(
          'A regular program refers to a program being implemented by the agencies on a continuing basis.'),
    );
  }
}

Widget buildCancel(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text('Cancel'),
  );
}

Widget buildUpdate(BuildContext context, Function onUpdate) {
  return FilledButton(
    onPressed: () {
      onUpdate();
    },
    child: const Text('Update'),
  );
}
