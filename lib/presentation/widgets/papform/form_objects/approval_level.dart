import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';
import 'package:pips/presentation/widgets/papform/update_button.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class ApprovalLevel extends ConsumerWidget {
  const ApprovalLevel({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIccable(context, ref),
        _buildApprovalLevel(context, ref),
        _buildApprovalLevelDate(context, ref),
      ],
    );
  }

  Widget _buildIccable(BuildContext context, WidgetRef ref) {
    final cip = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.cip));
    final iccable = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.iccable));

    return SwitchListTile(
      title: const Text(
          'Will require Investment Coordination Committee/NEDA Board Approval (ICC-able)?'),
      value: iccable ?? false,
      onChanged: cip ?? false
          ? (bool value) {
              ref
                  .read(fullProjectControllerProvider(uuid).notifier)
                  .update(iccable: value);
            }
          : null,
    );
  }

  Widget _buildApprovalLevel(BuildContext context, WidgetRef ref) {
    final iccable = ref.watch(
        fullProjectControllerProvider(uuid).select((value) => value.iccable));
    final approvalLevel = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.approvalLevel));

    return ListTile(
      enabled: iccable ?? false,
      title: const Text('Level (Status) of Approval'),
      subtitle: approvalLevel != null
          ? Text(approvalLevel.label)
          : const Text('Select one'),
      trailing: approvalLevel != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        _selectApprovalLevel(context, ref);
      },
    );
  }

  Future<void> _selectApprovalLevel(BuildContext context, WidgetRef ref) async {
    final approvalLevel = ref.watch(fullProjectControllerProvider(uuid)
        .select((value) => value.approvalLevel));
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
        .update(approvalLevel: response);
  }

  Widget _buildApprovalLevelDate(BuildContext context, WidgetRef ref) {
    final iccable = ref.watch(
        fullProjectControllerProvider(uuid).select((state) => state.iccable));
    final approvalLevelDate = ref.watch(fullProjectControllerProvider(uuid)
        .select((state) => state.approvalLevelDate));

    return ListTile(
      enabled: iccable ?? false,
      title: const Text('As of'),
      subtitle: approvalLevelDate != null
          ? Text(ref.watch(dateFormatterProvider).format(approvalLevelDate))
          : const Text('Select date'),
      trailing: approvalLevelDate != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      // TODO: update color on success
      onTap: () {
        _selectApprovalLevelDate(context, ref);
      },
    );
  }

  Future<void> _selectApprovalLevelDate(
      BuildContext context, WidgetRef ref) async {
    DateTime? approvalLevelDate = ref.watch(fullProjectControllerProvider(uuid)
        .select((state) => state.approvalLevelDate));

    final DateTime? response = await showDatePicker(
      context: context,
      initialDate: approvalLevelDate ?? DateTime.now(),
      firstDate: DateTime.utc(2010),
      lastDate: DateTime.now(),
    );

    ref
        .read(fullProjectControllerProvider(uuid).notifier)
        .update(approvalLevelDate: response);
  }
}
