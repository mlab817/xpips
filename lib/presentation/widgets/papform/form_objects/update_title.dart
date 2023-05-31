import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../success_indicator.dart';

class UpdateTitle extends ConsumerStatefulWidget {
  const UpdateTitle({super.key, this.uuid});

  final String? uuid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTitle();
}

class _UpdateTitle extends ConsumerState<UpdateTitle> {
  final FocusNode _node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _node.requestFocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Title'),
                  TextFormField(
                    initialValue: ref
                        .watch(fullProjectControllerProvider(widget.uuid))
                        .title,
                    focusNode: _node,
                    decoration: getTextInputDecoration(
                      hintText: 'Title',
                    ),
                    minLines: 1,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (String value) {
                      ref
                          .read(fullProjectControllerProvider(widget.uuid)
                              .notifier)
                          .update(title: value);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ref.watch(fullProjectControllerProvider(widget.uuid)
                          .select((value) => value.title)) !=
                      null
                  ? const SuccessIndicator()
                  : const EmptyIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
