import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';

import '../../../../domain/models/option.dart';
import '../../../controllers/fullproject_controller.dart';
import '../../../controllers/options_controller.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class PhysicalStatus extends ConsumerWidget {
  PhysicalStatus({
    Key? key,
  }) : super(key: key);

  final FocusNode _updateNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCategory(context, ref),
        _buildReadiness(context, ref),
        // implementation period
        _buildStart(context, ref),
        _buildEnd(context, ref),
        _buildUpdates(context, ref),
        _buildUpdatesAsOf(context, ref),
      ],
    );
  }

  /// TRIP only
  Widget _buildCategory(context, ref) {
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
      onTap: () {
        _selectCategory(context, ref);
      },
    );
  }

  ///
  ///
  Future<void> _selectCategory(context, ref) async {
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, selected);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );

    ref.read(fullProjectControllerProvider.notifier).update(category: response);
  }

  Widget _buildReadiness(context, ref) {
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
      onTap: () {
        _selectReadiness(context, ref);
      },
    );
  }

  Future<void> _selectReadiness(context, ref) async {
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, selected);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );

    // TODO: update category
    ref
        .read(fullProjectControllerProvider.notifier)
        .update(projectStatus: response);
  }

  Widget _buildUpdates(context, ref) {
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
  Widget _buildUpdatesAsOf(context, ref) {
    final asOf =
        ref.watch(fullProjectControllerProvider.select((state) => state.asOf));

    return ListTile(
      title: const Text('As of'),
      subtitle: asOf != null
          ? Text(ref.watch(dateFormatterProvider).format(asOf))
          : const Text('Select date'),
      trailing:
          asOf != null ? const SuccessIndicator() : const EmptyIndicator(),
      onTap: () {
        _selectUpdatesAsOf(context, ref);
      },
    );
  }

  ///
  ///
  Future<void> _selectUpdatesAsOf(context, ref) async {
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

  Widget _buildStart(context, ref) {
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
          ? () {
              _selectStart(context, ref);
            }
          : () {
              //
              _showSnackbar(
                message: 'Unable to change implementation period for programs.',
              );
            },
    );
  }

  ///
  ///
  Future<void> _selectStart(context, ref) async {
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
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, selected);
                },
                child: const Text('Update'),
              ),
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

  Widget _buildEnd(context, ref) {
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
          ? () {
              _selectEnd(context, ref);
            }
          : () {
              //
              _showSnackbar(
                message: 'Unable to change implementation period for programs.',
              );
            },
    );
  }

  Future<void> _selectEnd(context, ref) async {
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
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, selected);
                },
                child: const Text('Update'),
              ),
            ],
          );
        });

    ref.read(fullProjectControllerProvider.notifier).update(endYear: response);
  }

  void _showSnackbar({required String message}) {
    //
  }
}
