import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../success_indicator.dart';

class UpdateDescription extends ConsumerStatefulWidget {
  const UpdateDescription({super.key, this.uuid});

  final String? uuid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateDescription();
}

class _UpdateDescription extends ConsumerState<UpdateDescription> {
  late FocusNode _node = FocusNode();

  @override
  void initState() {
    super.initState();

    _node = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    _node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Description'),
      subtitle: TextFormField(
        focusNode: _node,
        initialValue: ref.watch(fullProjectControllerProvider(widget.uuid)
            .select((value) => value.description)),
        decoration: getTextInputDecoration(
          hintText: 'Description',
        ),
        minLines: 3,
        maxLines: 5,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (String value) {
          ref
              .read(fullProjectControllerProvider(widget.uuid).notifier)
              .update(description: value);
        },
      ),
      trailing: ref.watch(fullProjectControllerProvider(widget.uuid)
                      .select((value) => value.description)) !=
                  null &&
              ref
                      .watch(fullProjectControllerProvider(widget.uuid)
                          .select((value) => value.description))
                      ?.isNotEmpty !=
                  null
          ? const SuccessIndicator()
          : const EmptyIndicator(),
      onTap: () {
        // focus title
        _node.requestFocus();
      },
    );
  }
}
