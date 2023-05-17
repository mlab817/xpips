import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pips/presentation/controllers/offices_controller.dart';
import 'package:pips/presentation/controllers/options_controller.dart';
import 'package:pips/presentation/controllers/project_controller.dart';

import '../../data/requests/fullproject_request.dart';
import '../../domain/models/office.dart';
import '../../domain/models/option.dart';
import '../../domain/models/options.dart';
import '../widgets/papform/empty_indicator.dart';
import '../widgets/papform/form_objects/update_description.dart';
import '../widgets/papform/form_objects/update_financial_accomplishment.dart';
import '../widgets/papform/form_objects/update_fs_cost.dart';
import '../widgets/papform/form_objects/update_infra_sectors.dart';
import '../widgets/papform/form_objects/update_investment_cost.dart';
import '../widgets/papform/form_objects/update_pap.dart';
import '../widgets/papform/form_objects/update_pip.dart';
import '../widgets/papform/form_objects/update_regional_cost.dart';
import '../widgets/papform/form_objects/update_title.dart';
import '../widgets/papform/get_input_decoration.dart';
import '../widgets/papform/select_dialog_content.dart';
import '../widgets/papform/success_indicator.dart';

enum Status {
  error,
  success,
  neutral,
}

@RoutePage()
class NewPapScreen extends ConsumerStatefulWidget {
  const NewPapScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NewPapScreen> createState() => _NewPapStateScreen();
}

class _NewPapStateScreen extends ConsumerState<NewPapScreen> {
  late ScrollController _scrollController;

  // for reviewers use only

  // focus nodes
  final FocusNode _totalCostNode = FocusNode();
  final FocusNode _employedMaleNode = FocusNode();
  final FocusNode _employedFemaleNode = FocusNode();
  final FocusNode _expectedOutputNode = FocusNode();
  final FocusNode _riskNode = FocusNode();
  final FocusNode _updateNode = FocusNode();
  final FocusNode _remarkNode = FocusNode();
  final FocusNode _papCodeNode = FocusNode();
  final FocusNode _commentNode = FocusNode();
  final FocusNode _notesNode = FocusNode();

  int get _totalEmployment {
    int male = ref.watch(fullProjectControllerProvider
            .select((value) => value.employedMale)) ??
        0;
    int female = ref.watch(fullProjectControllerProvider
            .select((value) => value.employedFemale)) ??
        0;

    return male + female;
  }

  Options? _options;
  String? _error;

  // monitor scroll position
  double _scrollPercentage = 0;

  Future<void> _selectBases() async {
    final project = ref.watch(fullProjectControllerProvider);
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (context) {
        List<Option> selected = project.bases;

        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Basis for Implementation'),
          content: optionsAsync.when(
            data: (data) {
              return SelectDialogContent(
                options: data.data.bases ?? [],
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
            loading: () => const CircularProgressIndicator(),
          ),
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

    ref.read(fullProjectControllerProvider.notifier).update(bases: response);
  }

  // show radio to select office
  Future<void> _selectOffice() async {
    final office = ref
        .watch(fullProjectControllerProvider.select((value) => value.office));
    final officesAsync = ref.watch(officesControllerProvider);

    final Office? response = await showDialog(
        context: context,
        builder: (BuildContext context) {
          Office? selected = office;

          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            title: const Text('Office'),
            content: officesAsync.when(
              data: (data) {
                final offices = data.data;
                return SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: offices.length,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        value: offices[index],
                        groupValue: selected,
                        title: Text(offices[index].acronym),
                        onChanged: (Office? value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      );
                    },
                  ),
                );
              },
              error: (err, stackTrace) {
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

    ref.read(fullProjectControllerProvider.notifier).update(office: response);
  }

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
    final height = MediaQuery.of(context).size.height;
    final project = ref.watch(fullProjectControllerProvider);

    List<Widget> children = [
      const Text('General Information'),
      const UpdateTitle(),
      const UpdatePap(),
      _buildRegularProgram(),
      _buildBases(),
      const UpdateDescription(),
      _buildTotalProjectCost(),
      const Divider(),
      // office
      const Text('Implementers'),
      _buildOffice(),
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
      _buildRow(),
      _buildRowCost(),
      _buildRowAffectedHouseholds(),
      const Divider(),
      _buildRap(),
      _buildRapCost(),
      _buildRapAffectedHouseholds(),
      const Divider(),
      _buildRowRap(),
      const Divider(),
      _buildEmployment(),
      _buildEmploymentMale(),
      _buildEmploymentFemale(),
      const Divider(),
      const Text('Funding Source and Mode of Implementation'),
      _buildFundingSource(),
      _buildFundingSources(),
      _buildFundingInstitutions(),
      _buildImplementationMode(),
      const Divider(),
      const UpdateRegionalCost(),
      const Divider(),
      const UpdateInvestmentCost(),
      const Divider(),
      _buildCategory(),
      _buildReadiness(),
      // implementation period
      _buildStart(),
      _buildEnd(),
      _buildUpdates(),
      _buildUpdatesAsOf(),
      const Divider(),
      _buildPureGrant(),
      _buildPapCode(),
      const UpdateFinancialAccomplishment(),
      const Divider(),
      _buildRemarks(),
      const Divider(),
      _buildComments(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('New Program/Project'),
        actions: [
          FilledButton(
            onPressed: () async {
              // TODO: handle submit
              FullProjectRequest projectToSubmit =
                  FullProjectRequest.fromFullProject(project);

              debugPrint(projectToSubmit.toJson().toString());

              // TODO: handle form submission
            },
            child: const Text('Save'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // TODO: Update to form progress
          LinearProgressIndicator(
            value: _scrollPercentage,
          ),
          SizedBox(
            height: height - 60,
            // update if linear progress indicator resizes
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          ),
        ],
      ),
    );
  }

  Widget _buildRegularProgram() {
    final regularProgram = ref.watch(
        fullProjectControllerProvider.select((value) => value.regularProgram));
    final type =
        ref.watch(fullProjectControllerProvider.select((value) => value.type));

    return SwitchListTile(
      value: regularProgram ?? false,
      onChanged: type?.value == 1
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

  Widget _buildBases() {
    final bases =
        ref.watch(fullProjectControllerProvider.select((value) => value.bases));

    return ListTile(
      title: const Text('Basis for Implementation'),
      subtitle: bases.isNotEmpty
          ? Text(bases.map((e) => e.label).join(', '))
          : const Text(
              'Select as many as applicable',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      trailing:
          bases.isNotEmpty ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectBases,
    );
  }

  Widget _buildTotalProjectCost() {
    final totalCost = ref.watch(
        fullProjectControllerProvider.select((state) => state.totalCost));

    return ListTile(
      title: const Text('Total Project Cost in absolute PHP'),
      trailing:
          totalCost != null ? const SuccessIndicator() : const EmptyIndicator(),
      subtitle: TextFormField(
        focusNode: _totalCostNode,
        initialValue: totalCost?.toString() ?? '',
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: getTextInputDecoration(hintText: 'Total Project Cost'),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(totalCost: double.tryParse(value));
        },
      ),
      onTap: () {
        _totalCostNode.requestFocus();
      },
    );
  }

  Widget _buildOffice() {
    final office = ref
        .watch(fullProjectControllerProvider.select((value) => value.office));

    return ListTile(
      title: const Text('office'),
      subtitle:
          office != null ? Text(office.acronym) : const Text('Select one'),
      trailing:
          office != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectOffice,
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
  Widget _buildRow() {
    final hasRow = ref
        .watch(fullProjectControllerProvider.select((state) => state.hasRow));
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));

    return SwitchListTile(
      title: const Text('With Right of Way Component?'),
      value: hasRow ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(hasRow: value);
            }
          : null,
    );
  }

  // CIP only
  Widget _buildRowCost() {
    final windowWidth = MediaQuery.of(context).size.width - 128;
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
          columns: List.generate(6, (index) {
            return DataColumn(
              label: SizedBox(
                width: columnWidth,
                child: Center(
                  child: Text("FY ${2023 + index}"),
                ),
              ),
            );
          }),
          rows: [
            DataRow(
              cells: List.generate(
                6,
                (index) {
                  return DataCell(SizedBox(
                    width: columnWidth,
                    child: TextField(
                      key: ValueKey("row_$index"),
                      decoration: getTextInputDecoration(),
                      textAlign: TextAlign.right,
                      textAlignVertical: TextAlignVertical.center,
                      expands: false,
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowAffectedHouseholds() {
    final rowAffectedHouseholds = ref.watch(fullProjectControllerProvider
        .select((value) => value.rowAffectedHouseholds));

    return ListTile(
      title: const Text('Affected Households'),
      subtitle: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        // TODO: initial value and onChanged
        initialValue: rowAffectedHouseholds.toString(),
        decoration: getTextInputDecoration(),
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(rowAffectedHouseholds: int.tryParse(value));
        },
      ),
    );
  }

  // CIP only
  Widget _buildRap() {
    final hasRap = ref
        .watch(fullProjectControllerProvider.select((state) => state.hasRap));
    final cip =
        ref.watch(fullProjectControllerProvider.select((state) => state.cip));

    return SwitchListTile(
      title: const Text('With Resettlement Component?'),
      value: hasRap ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider.notifier)
                  .update(hasRap: value);
            }
          : null,
    );
  }

  // CIP only
  Widget _buildRapCost() {
    final windowWidth = MediaQuery.of(context).size.width - 128;
    final columnWidth = windowWidth / 6;

    final columns = List.generate(6, (index) {
      return DataColumn(
          label: SizedBox(
              width: columnWidth,
              child: Center(child: Text("FY ${2023 + index}"))));
    });

    final rows = [
      DataRow(
        cells: List.generate(
          6,
          (index) {
            return DataCell(SizedBox(
              width: columnWidth,
              child: TextField(
                key: ValueKey("rap_$index"),
                decoration: getTextInputDecoration(),
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.center,
                expands: false,
              ),
            ));
          },
        ),
      ),
    ];

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
          columns: columns,
          rows: rows,
        ),
      ),
    );
  }

  Widget _buildRapAffectedHouseholds() {
    return ListTile(
      title: const Text('Affected Households'),
      subtitle: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        // TODO: initial value and onChanged
        decoration: getTextInputDecoration(),
      ),
    );
  }

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

  Widget _buildEmployment() {
    final trip =
        ref.watch(fullProjectControllerProvider.select((state) => state.trip));

    return ListTile(
      enabled: trip ?? false,
      title: const Text('No. of persons to be employed'),
      subtitle: Text(_totalEmployment.toString()),
    );
  }

  Widget _buildEmploymentMale() {
    final employedMale = ref.watch(
        fullProjectControllerProvider.select((value) => value.employedMale));

    return ListTile(
      title: const Text('No. of Males'),
      subtitle: TextFormField(
        focusNode: _employedMaleNode,
        // TODO: initial value and onChanged
        initialValue: employedMale?.toString() ?? '',
        keyboardType: TextInputType.number,
        decoration: getTextInputDecoration(hintText: 'No. of Males'),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(employedMale: int.tryParse(value));
        },
      ),
      onTap: () {
        _employedMaleNode.requestFocus();
      },
    );
  }

  Widget _buildEmploymentFemale() {
    final employedFemale = ref.watch(
        fullProjectControllerProvider.select((value) => value.employedFemale));

    return ListTile(
      title: const Text('No. of Females'),
      subtitle: TextFormField(
        focusNode: _employedFemaleNode,
        // TODO: initial value and onChanged
        initialValue: employedFemale?.toString() ?? '',
        keyboardType: TextInputType.number,
        decoration: getTextInputDecoration(hintText: 'No. of Females'),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(employedFemale: int.tryParse(value));
        },
      ),
      onTap: () {
        _employedFemaleNode.requestFocus();
      },
    );
  }

  Widget _buildFundingSource() {
    final fundingSource = ref.watch(
        fullProjectControllerProvider.select((state) => state.fundingSource));
    final type =
        ref.watch(fullProjectControllerProvider.select((state) => state.type));

    return ListTile(
      title: const Text('Main Funding Source'),
      subtitle: fundingSource != null
          ? Text(fundingSource.label)
          : const Text('Select one'),
      trailing: fundingSource != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: type?.value != 1 ? _selectFundingSource : null,
    );
  }

  Future<void> _selectFundingSource() async {
    final fundingSource = ref.watch(
        fullProjectControllerProvider.select((value) => value.fundingSource));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = fundingSource;

        //
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Main Funding Source'),
          content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.fundingSources ?? [],
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
        .update(fundingSource: response);
  }

  Widget _buildFundingSources() {
    final fundingSources = ref.watch(
        fullProjectControllerProvider.select((value) => value.fundingSources));
    final type =
        ref.watch(fullProjectControllerProvider.select((value) => value.type));

    return ListTile(
      enabled: type?.value != 1,
      // enable only if pap type if not a program
      title: const Text('Other Funding Sources'),
      subtitle: fundingSources.isNotEmpty
          ? Text(fundingSources.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: fundingSources.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectFundingSources,
    );
  }

  Future<void> _selectFundingSources() async {
    final fundingSources = ref.watch(
        fullProjectControllerProvider.select((value) => value.fundingSources));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Option> selected = fundingSources;

        //
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Other Funding Sources'),
          content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.fundingSources ?? [],
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
      },
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(fundingSources: response);
  }

  Widget _buildImplementationMode() {
    final implementationMode = ref.watch(fullProjectControllerProvider
        .select((state) => state.implementationMode));
    final type =
        ref.watch(fullProjectControllerProvider.select((state) => state.type));

    return ListTile(
      title: const Text('Mode of Implementation'),
      subtitle: implementationMode != null
          ? Text(implementationMode.label)
          : const Text('Select one'),
      trailing: implementationMode != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: type?.value != 1 ? _selectImplementationMode : null,
    );
  }

  Future<void> _selectImplementationMode() async {
    final implementationMode = ref.watch(fullProjectControllerProvider
        .select((state) => state.implementationMode));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = implementationMode;

        //
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Mode of Implementation'),
          content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.implementationModes ?? [],
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
      },
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(implementationMode: response);
  }

  Widget _buildFundingInstitutions() {
    final fundingInstitutions = ref.watch(fullProjectControllerProvider
        .select((state) => state.fundingInstitutions));

    return ListTile(
      title: const Text('Funding Institutions'),
      subtitle: fundingInstitutions.isNotEmpty
          ? Text(fundingInstitutions.map((element) => element.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: fundingInstitutions.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      // TODO: disable if not NG-Grant/NG-Loan
      onTap: _selectFundingInstitutions,
    );
  }

  Future<void> _selectFundingInstitutions() async {
    final fundingInstitutions = ref.watch(fullProjectControllerProvider
        .select((state) => state.fundingInstitutions));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (BuildContext context) {
          List<Option> selected = fundingInstitutions;

          return AlertDialog(
            title: const Text('Funding Institutions'),
            content: optionsAsync.when(
                data: (data) {
                  return SelectDialogContent(
                    options: data.data.fundingInstitutions ?? [],
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
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(fundingInstitutions: response);
  }

  /// TRIP only
  Widget _buildCategory() {
    final trip =
        ref.watch(fullProjectControllerProvider.select((value) => value.trip));
    final category = ref
        .watch(fullProjectControllerProvider.select((value) => value.category));

    return ListTile(
      enabled: trip ?? false,
      title: const Text('Category'),
      subtitle:
          category != null ? Text(category.label) : const Text('Select one'),
      trailing:
          category != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectCategory,
    );
  }

  ///
  ///
  Future<void> _selectCategory() async {
    final category = ref
        .watch(fullProjectControllerProvider.select((value) => value.category));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = category;

        //
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Category'),
          content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.categories ?? [],
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
            })
          ],
        );
      },
    );

    ref.read(fullProjectControllerProvider.notifier).update(category: response);
  }

  Widget _buildReadiness() {
    final trip =
        ref.watch(fullProjectControllerProvider.select((value) => value.trip));
    final projectStatus = ref.watch(
        fullProjectControllerProvider.select((value) => value.projectStatus));

    return ListTile(
      enabled: trip ?? false,
      title: const Text('Status of ImplementationReadiness'),
      subtitle: projectStatus != null
          ? Text(projectStatus.label)
          : const Text('Select one'),
      trailing: projectStatus != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: _selectReadiness,
    );
  }

  Future<void> _selectReadiness() async {
    final projectStatus = ref.watch(
        fullProjectControllerProvider.select((value) => value.projectStatus));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = projectStatus;

        //
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: const Text('Status of Implementation Readiness'),
          content: optionsAsync.when(
              data: (data) {
                return SelectDialogContent(
                  options: data.data.projectStatuses ?? [],
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
      },
    );

    // TODO: update category
    ref
        .read(fullProjectControllerProvider.notifier)
        .update(projectStatus: response);
  }

  ///
  ///
  Widget _buildUpdates() {
    final updates = ref
        .watch(fullProjectControllerProvider.select((value) => value.updates));

    return ListTile(
      title: const Text('Updates'),
      subtitle: TextFormField(
        focusNode: _updateNode,
        // TODO: initial value and onChanged
        initialValue: updates,
        decoration: getTextInputDecoration(
            hintText:
                'For proposed program/project, please indicate the physical status of the program/project in terms of project preparation, approval, funding, etc. If ongoing, please provide information on the delivery of outputs, percentage of completion and financial status/ accomplishment in terms of utilization rate. Indicate the date of reference of the updates provided i.e. as of (month, day, year).'),
        minLines: 3,
        maxLines: 4,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider.notifier)
              .update(updates: value);
        },
      ),
      trailing: updates != null && updates.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        _updateNode.requestFocus();
      },
    );
  }

  ///
  ///
  Widget _buildUpdatesAsOf() {
    final asOf =
        ref.watch(fullProjectControllerProvider.select((state) => state.asOf));

    return ListTile(
      title: const Text('As of'),
      subtitle: asOf != null
          ? Text(DateFormat.yMMMd().format(asOf))
          : const Text('Select date'),
      trailing:
          asOf != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectUpdatesAsOf,
    );
  }

  ///
  ///
  Future<void> _selectUpdatesAsOf() async {
    final asOf =
        ref.watch(fullProjectControllerProvider.select((state) => state.asOf));

    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: asOf ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );

    ref.read(fullProjectControllerProvider.notifier).update(asOf: result);
  }

  ///
  ///
  Widget _buildStart() {
    final startYear = ref.watch(
        fullProjectControllerProvider.select((value) => value.startYear));
    final type =
        ref.watch(fullProjectControllerProvider.select((state) => state.type));

    return ListTile(
      title: const Text('Start of Project Implementation'),
      subtitle:
          startYear != null ? Text(startYear.label) : const Text('Select year'),
      trailing:
          startYear != null ? const SuccessIndicator() : const EmptyIndicator(),
      // _project.type?.value != 1
      onTap: type?.value != 1
          ? _selectStart
          : () {
              //
              _showSnackbar(
                message: 'Unable to change implementation period for programs.',
                status: Status.error,
              );
            },
    );
  }

  ///
  ///
  Future<void> _selectStart() async {
    final startYear = ref.watch(
        fullProjectControllerProvider.select((state) => state.startYear));
    final endYear = ref
        .watch(fullProjectControllerProvider.select((state) => state.endYear));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (context) {
          Option? selected = startYear;

          return AlertDialog(
            title: const Text('Start of Project Implementation'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
              data: (data) {
                final years = data.data.years
                        ?.where((element) => (element.value.toInt() <= 2028))
                        .toList() ??
                    [];

                return SelectDialogContent(
                  options: years,
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

    // clear end year if it is before start year
    if (endYear != null &&
        response != null &&
        endYear.value < response!.value) {
      ref.read(fullProjectControllerProvider.notifier).update(endYear: null);

      _showSnackbar(
          message:
              'Year of project completion has been removed because it is before the selected start of project implementation.');
    }

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(startYear: response);
  }

  Widget _buildEnd() {
    final startYear = ref.watch(
        fullProjectControllerProvider.select((state) => state.startYear));
    final endYear = ref
        .watch(fullProjectControllerProvider.select((state) => state.endYear));
    final type =
        ref.watch(fullProjectControllerProvider.select((state) => state.type));

    return ListTile(
      enabled: startYear != null,
      title: const Text('Year of Project Completion'),
      subtitle: endYear != null
          ? Text(endYear.label)
          : (startYear != null
              ? const Text('Select year')
              : const Text('Select start of project implementation first')),
      trailing:
          endYear != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: type?.value != 1
          ? _selectEnd
          : () {
              //
              _showSnackbar(
                message: 'Unable to change implementation period for programs.',
                status: Status.error,
              );
            },
    );
  }

  Future<void> _selectEnd() async {
    final endYear = ref
        .watch(fullProjectControllerProvider.select((state) => state.endYear));
    final optionsAsync = ref.watch(optionsControllerProvider);

    final response = await showDialog(
        context: context,
        builder: (BuildContext context) {
          Option? selected = endYear;

          return AlertDialog(
            title: const Text('Year of Project Completion'),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            content: optionsAsync.when(
                data: (data) {
                  final years = data.data.years
                          ?.where((element) => (element.value >= 2023))
                          .toList() ??
                      [];

                  return SelectDialogContent(
                    options: years,
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

    ref.read(fullProjectControllerProvider.notifier).update(endYear: response);
  }

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
