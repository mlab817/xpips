import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import '../../../controllers/patchproject_controller.dart';

class UpdateInfraSectors extends ConsumerWidget {
  const UpdateInfraSectors({
    Key? key,
    required this.project,
    required this.oldValue,
    required this.options,
    required this.onSubmit,
  }) : super(key: key);

  final FullProject project;
  final List<Option> oldValue;
  final List<Option> options;
  final Function(List<Option> newValue) onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        enabled: project.trip ?? false,
        title: const Text('Main Infrastructure Sector/Subsector'),
        subtitle: oldValue.isNotEmpty
            ? _buildList(oldValue)
            : const Text('NO ITEM(S) SELECTED'),
        onTap: () {
          _selectInfraSectors(context);
        },
      ),
    );
  }

  Widget _buildList(List<Option> selected) {
    return Wrap(
        children: selected
            .map(
              (element) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  label: Text(element.label),
                  visualDensity: VisualDensity.compact,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            )
            .toList());
  }

  Future<void> _selectInfraSectors(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return InfraSectorForm(
        oldValue: oldValue,
        options: options,
        onSubmit: onSubmit,
      );
    }));
  }
}

class InfraSectorForm extends ConsumerStatefulWidget {
  const InfraSectorForm({
    required this.oldValue,
    required this.options,
    required this.onSubmit,
    super.key,
  });

  final List<Option> oldValue;
  final List<Option> options;
  final Function(List<Option> newValue) onSubmit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InfraSectorFormState();
}

class _InfraSectorFormState extends ConsumerState<InfraSectorForm> {
  late List<Option> oldValue;
  late List<Option> newValue;

  @override
  void initState() {
    super.initState();

    oldValue = widget.oldValue;
    newValue = oldValue.toList(); // make the list mutable
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Infrastructure Sectors/Subsectors'),
        actions: [
          FilledButton(
            // disable if no changes have been made
            onPressed: const DeepCollectionEquality().equals(oldValue, newValue)
                ? null
                : () {
                    widget.onSubmit(newValue);
                  },
            child: ref.watch(patchProjectControllerProvider).isLoading
                ? const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(),
                  )
                : const Text('UPDATE'),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            final option = widget.options[index];

            if (option.children?.isNotEmpty != null) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile.adaptive(
                    activeColor: Theme.of(context).primaryColor,
                    value: newValue.contains(widget.options[index]),
                    title: Text(option.label),
                    onChanged: (bool? value) {
                      // if value is false, remove from list else add
                      if (value ?? false) {
                        setState(() {
                          newValue.add(option);
                        });
                      } else {
                        setState(() {
                          newValue.remove(option);
                        });
                      }
                    },
                  ),
                  ...option.children?.map((optionChild) {
                        return CheckboxListTile.adaptive(
                          activeColor: Theme.of(context).primaryColor,
                          value: newValue.contains(optionChild),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(optionChild.label),
                          ),
                          onChanged: (bool? value) {
                            if (value ?? false) {
                              setState(() {
                                newValue.add(optionChild);
                              });
                            } else {
                              setState(() {
                                newValue.remove(optionChild);
                              });
                            }
                          },
                        );
                      }).toList() ??
                      [],
                ],
              );
            }

            return CheckboxListTile.adaptive(
              value: newValue.contains(widget.options[index]),
              onChanged: (bool? value) {
                //
              },
            );
          }),
    );
  }
}
