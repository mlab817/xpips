import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/app_router.dart';
import 'package:pips/application/extensions.dart';
import 'package:pips/data/repositories/repositories.dart';

import '../../domain/models/option.dart';
import '../../presentation/controllers/controllers.dart';

@RoutePage()
class NewPapScreen extends ConsumerStatefulWidget {
  const NewPapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPapScreenState();
}

class _NewPapScreenState extends ConsumerState<NewPapScreen> {
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
                ? () async {
                    try {
                      final projectToSubmit =
                          ref.watch(simpleProjectProvider).toRequest();

                      print(projectToSubmit);

                      final response = await ref
                          .watch(projectRepositoryProvider)
                          .post(projectToSubmit);

                      if (!mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response.message.toString())));

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
                                    Navigator.pop(context);
                                  },
                                  child: const Text('RESET FORM'),
                                ),
                                //
                                FilledButton(
                                  onPressed: () {
                                    AutoRouter.of(context).push(
                                        PapViewRoute(uuid: response.data.uuid));
                                  },
                                  child: const Text('VIEW'),
                                ),
                              ],
                            );
                          });
                    } catch (err) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(err.toString())));
                    }
                  }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('PAP Title'),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: simpleProject.title,
                decoration: const InputDecoration(
                  hintText:
                      'PAP title should match the title to be submitted to the DBM.',
                ),
                onChanged: (String? value) {
                  ref
                      .read(simpleProjectControllerStateProvider.notifier)
                      .update(title: value);
                },
              ),
              const SizedBox(height: 30),
              const Text('Select whether the PAP is a Program or Project'),
              const SizedBox(height: 10),
              Row(
                children: optionsAsync?.types
                        ?.map((type) => Flexible(
                              child: InkWell(
                                onTap: () {
                                  //
                                  ref
                                      .read(simpleProjectControllerStateProvider
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
              const Text('Is it a regular program?'),
              const SizedBox(height: 10),
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
                            .read(simpleProjectControllerStateProvider.notifier)
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
              Column(
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
                                .read(simpleProjectControllerStateProvider
                                    .notifier)
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
                                      .read(simpleProjectControllerStateProvider
                                          .notifier)
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
              ),
              const SizedBox(height: 30),
              const Text('Description'),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: simpleProject.description,
                decoration: const InputDecoration(hintText: ''),
                minLines: 3,
                maxLines: 3,
                onChanged: (String? value) {
                  //
                  ref
                      .read(simpleProjectControllerStateProvider.notifier)
                      .update(description: value);
                },
              ),
              const SizedBox(height: 30),
              const Text('Total Cost (in ABSOLUTE PHP)'),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: simpleProject.totalCost.toString(),
                onChanged: (String? value) {
                  ref
                      .read(simpleProjectControllerStateProvider.notifier)
                      .update(totalCost: double.tryParse(value ?? ''));
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
