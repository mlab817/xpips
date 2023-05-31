import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_fs_cost.dart';
import 'package:pips/presentation/widgets/papform/update_button.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class FsInformation extends ConsumerWidget {
  const FsInformation({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      _buildPreparationDocument(context, ref),
      _buildFsStatus(context, ref),
      _buildNeedFsAssistance(context, ref),
      _buildFsCompletionDate(context, ref),
      UpdateFsCost(
        uuid: uuid,
      ),
    ]);
  }

  Widget _buildPreparationDocument(BuildContext context, WidgetRef ref) {
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cip));
    final preparationDocument = ref.watch(fullProjectControllerProvider(uuid)
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
      onTap: () {
        _selectPreparationDocument(context, ref);
      },
    );
  }

  Future<void> _selectPreparationDocument(
      BuildContext context, WidgetRef ref) async {
    final preparationDocument = ref.watch(fullProjectControllerProvider(uuid)
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
            CancelButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            UpdateButton(
              onPressed: () {
                Navigator.pop(context, selected);
              },
            ),
          ],
        );
      },
    );

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(preparationDocument: response);
  }

  // CIP only
  Widget _buildNeedFsAssistance(BuildContext context, WidgetRef ref) {
    final fsNeedsAssistance = ref.watch(fullProjectControllerProvider(uuid)
        .select((state) => state.fsNeedsAssistance));
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.cip));

    return SwitchListTile(
      value: fsNeedsAssistance ?? false,
      title:
          const Text('Requires assistance in the conduct of Feasibility Study'),
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider(uuid).notifier)
                  .update(fsNeedsAssistance: value);
            }
          : null,
    );
  }

  // CIP only
  Widget _buildFsStatus(BuildContext context, WidgetRef ref) {
    final fsStatus = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.fsStatus));
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.cip));

    return ListTile(
      title: const Text('Status of Feasibility Study'),
      subtitle:
          fsStatus != null ? Text(fsStatus.label) : const Text('Select one'),
      trailing:
          fsStatus != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: cip ?? false
          ? () {
              _selectFsStatus(context, ref);
            }
          : null,
    );
  }

  Future<void> _selectFsStatus(BuildContext context, WidgetRef ref) async {
    final fsStatus = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.fsStatus));
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
                        selected = value;
                      });
                },
                error: (error, stacktrace) {
                  return Container();
                },
                loading: () => const CircularProgressIndicator()),
            actions: [
              CancelButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              UpdateButton(
                onPressed: () {
                  Navigator.pop(context, selected);
                },
              ),
            ],
          );
        });

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(fsStatus: response);
  }

  Widget _buildFsCompletionDate(BuildContext context, WidgetRef ref) {
    final fsCompletionDate = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.fsCompletionDate));
    final preparationDocument = ref.watch(fullProjectControllerProvider(uuid)
        .select((state) => state.preparationDocument));

    return ListTile(
      title: const Text('F/S Target Completion Date'),
      subtitle: fsCompletionDate != null
          ? Text(ref.watch(dateFormatterProvider).format(fsCompletionDate))
          : const Text('Select date'),
      trailing: fsCompletionDate != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: preparationDocument != null && preparationDocument.value == 2
          ? () {
              _selectFsCompletionDate(context, ref);
            }
          : null,
    );
  }

  Future<void> _selectFsCompletionDate(
      BuildContext context, WidgetRef ref) async {
    final fsCompletionDate = ref.watch(fullProjectControllerProvider(uuid)
        .select((state) => state.fsCompletionDate));

    final DateTime? response = await showDatePicker(
      context: context,
      initialDate: fsCompletionDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2028),
    );

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(fsCompletionDate: response);
  }
}
