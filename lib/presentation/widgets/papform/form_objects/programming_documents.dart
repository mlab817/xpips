import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_pip.dart';
import 'package:pips/presentation/widgets/papform/form_section_header.dart';
import 'package:pips/presentation/widgets/papform/update_button.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class ProgrammingDocuments extends ConsumerWidget {
  const ProgrammingDocuments({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FormSectionHeader(
            title: 'PAP for Inclusive in which Programming Document/s'),
        UpdatePip(uuid: uuid),
        _buildTypology(context, ref),
        _buildCip(context, ref),
        _buildCipType(context, ref),
        _buildTrip(context, ref),
        _buildRdip(context, ref),
        _buildResearch(context, ref),
        _buildCovid(context, ref),
      ],
    );
  }

  Widget _buildTypology(BuildContext context, WidgetRef ref) {
    final pip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.pip));
    final typology = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.typology));

    return ListTile(
      enabled: pip ?? false,
      title: const Text('Typology'),
      subtitle:
      typology != null ? Text(typology.label) : const Text('Select one'),
      trailing:
      typology != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: () {
        _selectTypology(context, ref);
      },
    );
  }

  Future<void> _selectTypology(BuildContext context, WidgetRef ref) async {
    final typology = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.typology));
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
              CancelButton(onPressed: () {
                Navigator.pop(context);
              }),
              UpdateButton(onPressed: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(typology: response);
  }

  Widget _buildCip(BuildContext context, WidgetRef ref) {
    // TODO: add a confirmation dialog to check if the PAP meets any of the
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cip));

    // CIP criteria
    return SwitchListTile(
        value: cip ?? false,
        title: const Text('Core Investment Program/Project'),
        subtitle:
        const Text('// TODO: Explain the requirements to be part of CIP'),
        onChanged: (bool? value) {
          // if user is trying to change config
          _toggleCip(context, ref, value);
        });
  }

  Future<void> _toggleCip(BuildContext context, WidgetRef ref,
      bool? value) async {
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cip));

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
                CancelButton(onPressed: () {
                  Navigator.pop(context);
                }),
                UpdateButton(onPressed: () {
                  Navigator.pop(context, cip);
                }),
              ],
            );
          });

      // set the iccable to be the same as CIP since
      // CIP tagging requires ICCable
      ref.read(fullProjectControllerProvider(uuid).notifier).update(
        cip: value ?? false,
        iccable: value,
      );

      if (value ?? false) {
        if (!context.mounted) return;

        _showSnackbar(
          context,
          'PAPs tagged as CIP require ICC/NEDA Board approval. Make sure to provide the type and processing status below.',
        );
      }
    }
  }

  Widget _buildCipType(BuildContext context, WidgetRef ref) {
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cip));
    final cipType = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cipType));

    return ListTile(
      enabled: cip ?? false,
      title: const Text('Type of CIP'),
      subtitle:
      cipType != null ? Text(cipType.label) : const Text('Select one'),
      trailing:
      cipType != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: cip ?? false ? () {
        _selectCipType(context, ref);
      } : null,
    );
  }

  Future<void> _selectCipType(BuildContext context, WidgetRef ref) async {
    final cipType = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cipType));
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
              CancelButton(onPressed: () {
                Navigator.pop(context);
              }),
              UpdateButton(onPressed: () {
                Navigator.pop(context, selected);
              }),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(cipType: response);
  }

  Widget _buildTrip(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.trip));

    return SwitchListTile(
        value: trip ?? false,
        title: const Text('Three Year Rolling Infrastructure Program'),
        subtitle:
        const Text('// TODO: Explain the requirements to be part of TRIP'),
        onChanged: (bool? value) {
          ref
              .read(fullProjectControllerProvider(uuid).notifier)
              .update(trip: value);
        });
  }

  Widget _buildRdip(BuildContext context, WidgetRef ref) {
    final rdip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.rdip));

    return SwitchListTile(
        value: rdip ?? false,
        title: const Text('Regional Development Investment Program'),
        // TODO: Explain the requirements to be part of RDIP
        subtitle: const Text(
            'To facilitate validation, please make sure to upload the relevant RDC endorsement later.'),
        onChanged: (bool? value) {
          ref
              .read(fullProjectControllerProvider(uuid).notifier)
              .update(rdip: value);
        });
    // TODO: require user to attach RDIP
    // For RDIP, the user should only submit two pages, 1 - RDC endorsement / reso
    // and 2 - the relevant page of the RDIP where the PAP is present
  }

  Widget _buildResearch(BuildContext context, WidgetRef ref) {
    final research = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.research));

    return SwitchListTile(
        value: research ?? false,
        title: const Text('Is it a research and development project?'),
        // TODO: Explain the requirements to be part of RDIP
        onChanged: (bool? value) {
          ref
              .read(fullProjectControllerProvider(uuid).notifier)
              .update(research: value);
        });
  }

  Widget _buildCovid(BuildContext context, WidgetRef ref) {
    final covid = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.covid));

    return SwitchListTile(
        value: covid ?? false,
        title: const Text('Is it response to COVID-19 pandemic'),
        // TODO: Explain the requirements to be a response of COVID-19
        onChanged: (bool? value) {
          ref
              .read(fullProjectControllerProvider(uuid).notifier)
              .update(covid: value);
        });
  }

  void _showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
