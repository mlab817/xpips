import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/controllers/fullproject_controller.dart';
import 'package:pips/presentation/controllers/options_controller.dart';
import 'package:pips/presentation/widgets/papform/form_objects/approval_level.dart';
import 'package:pips/presentation/widgets/papform/form_objects/employment.dart';
import 'package:pips/presentation/widgets/papform/form_objects/fs_information.dart';
import 'package:pips/presentation/widgets/papform/form_objects/funding_source_implementation.dart';
import 'package:pips/presentation/widgets/papform/form_objects/general_information.dart';
import 'package:pips/presentation/widgets/papform/form_objects/physical_status.dart';
import 'package:pips/presentation/widgets/papform/form_objects/programming_documents.dart';
import 'package:pips/presentation/widgets/papform/form_objects/row.dart';
import 'package:pips/presentation/widgets/papform/form_objects/spatial_coverage.dart';
import 'package:pips/presentation/widgets/papform/form_objects/trip_information.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_financial_accomplishment.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_investment_cost.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_locations.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_office.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_ous.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_rap.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_regional_cost.dart';
import 'package:pips/presentation/widgets/papform/form_section_header.dart';

import '../../domain/models/option.dart';
import 'papform/empty_indicator.dart';
import 'papform/get_input_decoration.dart';
import 'papform/select_dialog_content.dart';
import 'papform/success_indicator.dart';

enum Status {
  error,
  success,
  neutral,
}

class PapForm extends ConsumerStatefulWidget {
  const PapForm({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

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

  Future<void> _selectSdgs() async {
    final sdgs = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((value) => value.sdgs));
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

    ref
        .read(fullProjectControllerProvider(widget.uuid).notifier)
        .update(sdgs: response);
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
    // watch optionsControllerProvider
    ref.watch(optionsControllerProvider);

    List<Widget> children = [
      GeneralInformation(uuid: widget.uuid),
      const Divider(),
      // // office
      const FormSectionHeader(title: 'Implementers'),
      UpdateOffice(uuid: widget.uuid),
      UpdateOus(uuid: widget.uuid),
      const Divider(),
      const FormSectionHeader(title: 'Spatial Coverage'),
      SpatialCoverage(uuid: widget.uuid),
      UpdateLocations(uuid: widget.uuid),
      const Divider(),
      ProgrammingDocuments(uuid: widget.uuid),
      const Divider(),
      const FormSectionHeader(title: 'Level of Approval'),
      ApprovalLevel(uuid: widget.uuid),
      const Divider(),
      const FormSectionHeader(title: 'TRIP Information'),
      TripInformation(uuid: widget.uuid),
      const Divider(),
      const FormSectionHeader(title: 'Socioeconomic Agenda'),
      _buildAgenda(),
      const Divider(),
      const FormSectionHeader(title: 'Sustainable Development Goals'),
      _buildSdgs(),
      const Divider(),
      const FormSectionHeader(title: 'Gender and Development Responsiveness'),
      _buildGad(),
      const Divider(),
      const FormSectionHeader(title: 'Pre-Investment Requirements'),
      FsInformation(uuid: widget.uuid),
      const Divider(),
      UpdateRow(uuid: widget.uuid),
      const Divider(),
      UpdateRap(uuid: widget.uuid),
      const Divider(),
      _buildRowRap(),
      const Divider(),
      const FormSectionHeader(title: 'Employment Generated'),
      EmploymentGenerated(uuid: widget.uuid),
      const Divider(),
      const FormSectionHeader(
          title: 'Funding Source and Mode of Implementation'),
      UpdateFundingSourceAndImplementation(uuid: widget.uuid),
      const Divider(),
      const FormSectionHeader(title: 'Investment Cost by Region'),
      UpdateRegionalCost(uuid: widget.uuid),
      const Divider(),
      const FormSectionHeader(title: 'Investment Cost by Funding Source'),
      UpdateInvestmentCost(uuid: widget.uuid),
      const Divider(),
      PhysicalStatus(uuid: widget.uuid),
      const Divider(),
      // _buildPureGrant(),
      // _buildPapCode(),
      const Divider(),
      const FormSectionHeader(title: 'Financial Accomplishments'),
      UpdateFinancialAccomplishment(uuid: widget.uuid),
      const Divider(),
      _buildRemarks(),
      const Divider(),
      _buildNotes(),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSdgs() {
    final sdgs = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.sdgs));
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
    final agenda = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.agenda));
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
    final agenda = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.agenda));
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

    ref
        .read(fullProjectControllerProvider(widget.uuid).notifier)
        .update(agenda: response);
  }

  Widget _buildGad() {
    final cip = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.cip));
    final gad = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.gad));

    return ListTile(
      enabled: cip ?? false,
      title: const Text('Level of Gender Responsiveness'),
      subtitle: gad != null ? Text(gad.label) : const Text('Select one'),
      trailing: gad != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: _selectGad,
    );
  }

  Future<void> _selectGad() async {
    final gad = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.gad));
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

    ref
        .read(fullProjectControllerProvider(widget.uuid).notifier)
        .update(gad: response);
  }

  // CIP only

  // CIP only

  // CIP only
  Widget _buildRowRap() {
    final hasRowRap = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.hasRowRap));
    final cip = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.cip));

    return SwitchListTile(
      title: const Text('With Right and Way and Resettlement Component?'),
      value: hasRowRap ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider(widget.uuid).notifier)
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
    final pureGrant = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.pureGrant));
    final uacsCode = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.uacsCode));

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
              .read(fullProjectControllerProvider(widget.uuid).notifier)
              .update(uacsCode: value);
        },
      ),
    );
  }

  Widget _buildPureGrant() {
    final pureGrant = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.pureGrant));
    final type = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.type));

    return SwitchListTile(
      value: pureGrant ?? false,
      title: const Text('This is pure grant.'),
      //
      onChanged: type?.value != 1
          ? (bool? value) {
              ref
                  .read(fullProjectControllerProvider(widget.uuid).notifier)
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
        initialValue: ref.watch(fullProjectControllerProvider(widget.uuid)
            .select((state) => state.remarks)),
        decoration: getTextInputDecoration(hintText: 'Remarks'),
        style: Theme.of(context).textTheme.bodyMedium,
        minLines: 3,
        maxLines: 5,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider(widget.uuid).notifier)
              .update(remarks: value);
        },
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
    ref.read(fullProjectControllerProvider(widget.uuid).notifier).update(
          iccable: false,
          cipType: null,
          approvalLevel: null,
          approvalLevelDate: null,
          gad: null,
        );
  }
}
