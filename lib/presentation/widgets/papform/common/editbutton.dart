import 'package:flutter/material.dart';
import 'package:pips/application/constants.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.onPressed,
    this.enabled = true,
  });

  final Function()? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return width <= smallScreenMinWidthConstant
        ? IconButton.outlined(
            onPressed: enabled ? onPressed : null,
            icon: Icon(
              enabled ? Icons.border_color_outlined : Icons.edit_off,
              size: 16,
              color: enabled
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.error,
            ),
          )
        : OutlinedButton.icon(
            onPressed: enabled ? onPressed : null,
            label: const Text(
              'EDIT',
              style: TextStyle(fontSize: 14),
            ),
            icon: Icon(
              enabled ? Icons.border_color_outlined : Icons.edit_off,
              size: 16,
              color: enabled
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.error,
            ),
          );
  }
}
