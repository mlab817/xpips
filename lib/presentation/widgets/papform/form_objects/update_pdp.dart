import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform/cancel_button.dart';
import 'package:pips/presentation/widgets/papform/update_button.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdatePdp extends ConsumerStatefulWidget {
  const UpdatePdp({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  ConsumerState<UpdatePdp> createState() => _UpdatePdpState();
}

class _UpdatePdpState extends ConsumerState<UpdatePdp> {
  final FocusNode _expectedOutputNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildPdpChapter(context, ref),
        _buildPdpChapters(context, ref),
        _buildExpectedOutputs(context, ref),
      ],
    );
  }

  Widget _buildPdpChapter(BuildContext context, WidgetRef ref) {
    final pdpChapter = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.pdpChapter));

    //
    return ListTile(
      title: const Text('Main PDP Chapter'),
      subtitle: pdpChapter != null
          ? Text(pdpChapter.label)
          : const Text('Select one'),
      trailing: pdpChapter != null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        _selectPdpChapter(context, ref);
      },
    );
  }

  Widget _buildPdpChapters(BuildContext context, WidgetRef ref) {
    final pdpChapters = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.pdpChapters));
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

  Widget _buildExpectedOutputs(BuildContext context, WidgetRef ref) {
    final expectedOutputs = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.expectedOutputs));

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
              .read(fullProjectControllerProvider(widget.uuid).notifier)
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

  Future<void> _selectPdpChapter(context, ref) async {
    final pdpChapter = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((value) => value.pdpChapter));
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
        .update(pdpChapter: response);
  }

  Future<void> _selectPdpChapters() async {
    final pdpChapters = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((value) => value.pdpChapters));
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
        .update(pdpChapters: response);
  }
}
