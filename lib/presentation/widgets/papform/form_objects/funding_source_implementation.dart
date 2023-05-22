import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../select_dialog_content.dart';
import '../success_indicator.dart';

class UpdateFundingSourceAndImplementation extends ConsumerWidget {
  const UpdateFundingSourceAndImplementation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFundingSource(context, ref),
        _buildFundingSources(context, ref),
        _buildFundingInstitutions(context, ref),
        _buildImplementationMode(context, ref),
      ],
    );
  }

  Widget _buildFundingSource(context, ref) {
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
      onTap: type?.value != 1
          ? () {
              _selectFundingSource(context, ref);
            }
          : null,
    );
  }

  Future<void> _selectFundingSource(context, ref) async {
    final fundingSource = ref.watch(
        fullProjectControllerProvider.select((value) => value.fundingSource));

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = fundingSource;
        final optionsAsync = ref.watch(optionsControllerProvider);
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
              return Center(
                child: Text(error.toString()),
              );
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
      },
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(fundingSource: response);
  }

  Widget _buildFundingSources(context, ref) {
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
      onTap: () {
        _selectFundingSources(context, ref);
      },
    );
  }

  Future<void> _selectFundingSources(context, ref) async {
    final fundingSources = ref.watch(
        fullProjectControllerProvider.select((value) => value.fundingSources));

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Option> selected = fundingSources;
        final optionsAsync = ref.watch(optionsControllerProvider);

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
              return Center(
                child: Text(error.toString()),
              );
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
      },
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(fundingSources: response);
  }

  Widget _buildImplementationMode(context, ref) {
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
      onTap: type?.value != 1
          ? () {
              _selectImplementationMode(context, ref);
            }
          : null,
    );
  }

  Future<void> _selectImplementationMode(context, ref) async {
    final implementationMode = ref.watch(fullProjectControllerProvider
        .select((state) => state.implementationMode));

    final response = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Option? selected = implementationMode;
        final optionsAsync = ref.watch(optionsControllerProvider);
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
              return Center(
                child: Text(error.toString()),
              );
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
      },
    );

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(implementationMode: response);
  }

  Widget _buildFundingInstitutions(context, ref) {
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
      onTap: () {
        _selectFundingInstitutions(context, ref);
      },
    );
  }

  Future<void> _selectFundingInstitutions(context, ref) async {
    final fundingInstitutions = ref.watch(fullProjectControllerProvider
        .select((state) => state.fundingInstitutions));

    final response = await showDialog(
        context: context,
        builder: (BuildContext context) {
          final optionsAsync = ref.watch(optionsControllerProvider);
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
                return Center(
                  child: Text(error.toString()),
                );
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

    ref
        .read(fullProjectControllerProvider.notifier)
        .update(fundingInstitutions: response);
  }
}
