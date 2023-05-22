import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/controllers.dart';
import '../empty_indicator.dart';
import '../get_input_decoration.dart';
import '../success_indicator.dart';

class UpdateTitle extends ConsumerStatefulWidget {
  const UpdateTitle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTitle();
}

class _UpdateTitle extends ConsumerState {
  final FocusNode _node = FocusNode();

  @override
  Widget build(BuildContext context) {
    final title =
        ref.watch(fullProjectControllerProvider.select((value) => value.title));

    debugPrint('rebuilding UpdateTitle');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Title'),
                TextField(
                  focusNode: _node,
                  decoration: getTextInputDecoration(
                    hintText: 'Title',
                  ),
                  minLines: 1,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                  onChanged: (String value) {
                    ref
                        .read(fullProjectControllerProvider.notifier)
                        .update(title: value);
                  },
                )
              ],
            ),
          ),
          title != null ? const SuccessIndicator() : const EmptyIndicator(),
        ],
      ),
    );
  }
}
