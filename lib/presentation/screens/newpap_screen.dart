import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';

import '../../application/app_router.dart';
import '../../application/extensions.dart';
import '../../application/functions.dart';
import '../../data/repositories/repositories.dart';
import '../../presentation/widgets/papform/common/numericeditor.dart';
import '../../domain/entities/models.dart';
import '../../presentation/controllers/controllers.dart';

@RoutePage()
class NewPapScreen extends ConsumerStatefulWidget {
  const NewPapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPapScreenState();
}

class _NewPapScreenState extends ConsumerState<NewPapScreen> {
  // create texteditingcontrollers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _totalCostController = TextEditingController();

  Future<void> _handleSave() async {
// show loading screen
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: LoadingOverlay(),
          );
        });

    try {
      final projectToSubmit = ref.watch(simpleProjectProvider).toRequest();

      final response =
          await ref.watch(projectRepositoryProvider).post(projectToSubmit);

      if (!mounted) return;

      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('SUCCESS'),
              content: const Text('PAP successfully added.'),
              actions: [
                // reset
                TextButton(
                  onPressed: () {
                    ref
                        .read(simpleProjectControllerStateProvider.notifier)
                        .reset();

                    _resetControllers();

                    Navigator.pop(context);
                  },
                  child: const Text('RESET FORM'),
                ),
                //
                FilledButton(
                  onPressed: () {
                    AutoRouter.of(context)
                        .push(PapViewRoute(uuid: response.data.uuid));
                  },
                  child: const Text('VIEW'),
                ),
              ],
            );
          });
    } catch (err) {
      Navigator.pop(context);

      showSnackBar(context, err.toString());
    }
  }

  void _resetControllers() {
    _titleController.text = '';
    _descriptionController.text = '';
    _totalCostController.text = '';
  }

  @override
  void initState() {
    super.initState();

    _titleController.addListener(() {
      ref
          .read(simpleProjectControllerStateProvider.notifier)
          .update(title: _titleController.text);
    });
    _descriptionController.addListener(() {
      ref
          .read(simpleProjectControllerStateProvider.notifier)
          .update(description: _descriptionController.text);
    });
    _totalCostController.addListener(() {
      double updatedValue =
          double.tryParse(_totalCostController.text.replaceAll(',', '')) ?? 0;
      ref
          .read(simpleProjectControllerStateProvider.notifier)
          .update(totalCost: updatedValue);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _totalCostController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final optionsAsync = ref.watch(optionsControllerProvider).value;
    final simpleProject = ref.watch(simpleProjectProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Add Program/Project'),
        actions: [
          const Text('Please complete all fields'),
          const SizedBox(
            width: 10,
          ),
          // enable if valid
          FilledButton(
            onPressed: ref.watch(simpleProjectControllerStateProvider).isValid
                ? _handleSave
                : null,
            child: const Text('Save'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PAP Title'),
                  const SizedBox(height: 10),
                  // title
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText:
                          'PAP title should match the title to be submitted to the DBM.',
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                      'Select whether the PAP is a Program or a Project'),
                  const SizedBox(height: 10),
                  // types
                  Row(
                    children: optionsAsync?.types
                            ?.map((type) => Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      //
                                      ref
                                          .read(
                                              simpleProjectControllerStateProvider
                                                  .notifier)
                                          .update(type: type);
                                    },
                                    child: Row(
                                      children: [
                                        Radio<Option>(
                                          groupValue: simpleProject.type,
                                          value: type,
                                          onChanged: (Option? value) {
                                            ref
                                                .read(
                                                    simpleProjectControllerStateProvider
                                                        .notifier)
                                                .update(type: value);
                                          },
                                        ),
                                        Text(type.label),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList() ??
                        [],
                  ),
                  const SizedBox(height: 30),
                  const Text('Is the PAP a regular program?'),
                  const SizedBox(height: 10),
                  // regular program
                  InkWell(
                    onTap: () {
                      ref
                          .read(simpleProjectControllerStateProvider.notifier)
                          .update(
                              regularProgram: !ref
                                  .read(simpleProjectControllerStateProvider)
                                  .project
                                  .regularProgram);
                    },
                    child: Row(
                      children: [
                        Checkbox(
                          value: simpleProject.regularProgram,
                          onChanged: (bool? value) {
                            ref
                                .read(simpleProjectControllerStateProvider
                                    .notifier)
                                .update(regularProgram: value);
                          },
                        ),
                        const Text(
                            'Tick the checkbox if the PAP is a regular program'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text('Basis for Implementation'),
                  Text(
                    'Select as many as applicable',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.apply(color: Colors.black38),
                  ),
                  const SizedBox(height: 10),
                  // basis
                  _buildBases(),
                  const SizedBox(height: 30),
                  const Text('Description'),
                  const SizedBox(height: 10),
                  // description
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: ''),
                    minLines: 3,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 30),
                  const Text('Total Cost (in ABSOLUTE PHP)'),
                  const SizedBox(height: 10),
                  // total cost
                  TextFormField(
                    // initialValue: simpleProject.totalCost.toString(),
                    controller: _totalCostController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      NumericTextFormatter(),
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBases() {
    final optionsAsync = ref.watch(optionsControllerProvider).value;
    final simpleProject = ref.watch(simpleProjectProvider);

    return Column(
      children: optionsAsync?.bases?.map(
            (basis) {
              return InkWell(
                onTap: () {
                  final curSelection = simpleProject.bases
                      .toList(); // copy the current selection

                  if (!simpleProject.bases.contains(basis)) {
                    curSelection.add(basis);
                  } else {
                    curSelection.remove(basis);
                  }

                  ref
                      .read(simpleProjectControllerStateProvider.notifier)
                      .update(bases: curSelection);
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: simpleProject.bases.contains(basis),
                      onChanged: (bool? value) {
                        final curSelection = simpleProject.bases
                            .toList(); // copy the current selection

                        if (value ?? false) {
                          curSelection.add(basis);
                        } else {
                          curSelection.remove(basis);
                        }

                        ref
                            .read(simpleProjectControllerStateProvider.notifier)
                            .update(bases: curSelection);
                      },
                    ),
                    Flexible(
                      child: Text(
                        basis.label,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList() ??
          [],
    );
  }
}
