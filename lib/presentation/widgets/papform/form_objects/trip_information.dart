import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_infra_sectors.dart';
import 'package:pips/presentation/widgets/papform/update_button.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class TripInformation extends ConsumerStatefulWidget {
  const TripInformation({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  ConsumerState<TripInformation> createState() => _TripInformationState();
}

class _TripInformationState extends ConsumerState<TripInformation> {
  final FocusNode _riskNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UpdateInfraSectors(
          uuid: widget.uuid,
        ),
        _buildPrerequisites(context, ref),
        _buildRisk(context, ref),
      ],
    );
  }

  Widget _buildPrerequisites(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.trip));
    final prerequisites = ref
        .watch(fullProjectControllerProvider(widget.uuid)
            .select((state) => state.prerequisites))
        .toList();

    return ListTile(
      enabled: trip ?? false,
      title: const Text('Status of Implementation Readiness'),
      subtitle: prerequisites.isNotEmpty
          ? Text(prerequisites.map((e) => e.label).join(', '))
          : const Text('Select as many as applicable'),
      trailing: prerequisites.isNotEmpty
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        _selectPrerequisites(context, ref);
      },
    );
  }

  Future<void> _selectPrerequisites(BuildContext context, WidgetRef ref) async {
    final prerequisites = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.prerequisites));
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
                  return Center(
                    child: Text(error.toString()),
                  );
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
        .read(fullProjectControllerProvider(widget.uuid).notifier)
        .update(prerequisites: response);
  }

  Widget _buildRisk(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((value) => value.trip));
    final risk = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((value) => value.risk));

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
                .read(fullProjectControllerProvider(widget.uuid).notifier)
                .update(risk: value);
          }),
      onTap: () {
        _riskNode.requestFocus();
      },
    );
  }
}
