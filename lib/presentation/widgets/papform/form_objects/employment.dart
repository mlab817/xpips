import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/extensions.dart';

import '../../../controllers/fullproject_controller.dart';
import '../get_input_decoration.dart';

class EmploymentGenerated extends ConsumerStatefulWidget {
  const EmploymentGenerated({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmploymentGenerated();
}

class _EmploymentGenerated extends ConsumerState<EmploymentGenerated> {
  final FocusNode employedMaleNode = FocusNode();
  final FocusNode employedFemaleNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildEmployment(ref),
        _buildEmploymentMale(context, ref),
        _buildEmploymentFemale(context, ref),
      ],
    );
  }

  Widget _buildEmployment(ref) {
    final trip = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((state) => state.trip));

    return ListTile(
      enabled: trip ?? false,
      title: const Text('No. of persons to be employed'),
      subtitle: Text(
        ref
            .watch(fullProjectControllerProvider(widget.uuid)
                .select((value) => value.totalEmployment()))
            .toString(),
      ),
    );
  }

  Widget _buildEmploymentMale(context, ref) {
    final employedMale = ref.watch(fullProjectControllerProvider(widget.uuid)
        .select((value) => value.employedMale));

    return ListTile(
      title: const Text('No. of Males'),
      subtitle: TextFormField(
        focusNode: employedMaleNode,
        initialValue: employedMale?.toString() ?? '',
        keyboardType: TextInputType.number,
        decoration: getTextInputDecoration(hintText: 'No. of Males'),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider(widget.uuid).notifier)
              .update(employedMale: int.tryParse(value));
        },
      ),
      onTap: () {
        employedMaleNode.requestFocus();
      },
    );
  }

  Widget _buildEmploymentFemale(context, ref) {
    return ListTile(
      title: const Text('No. of Females'),
      subtitle: TextFormField(
        focusNode: employedFemaleNode,
        initialValue: ref
            .watch(fullProjectControllerProvider(widget.uuid))
            .employedFemale
            .toString(),
        keyboardType: TextInputType.number,
        decoration: getTextInputDecoration(hintText: 'No. of Females'),
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider(widget.uuid).notifier)
              .update(employedFemale: int.tryParse(value));
        },
      ),
      onTap: () {
        employedFemaleNode.requestFocus();
      },
    );
  }
}
