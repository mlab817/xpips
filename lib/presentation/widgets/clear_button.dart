import 'package:flutter/material.dart';

import '../../application/constants.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return width <= smallScreenMinWidthConstant
        ? IconButton.outlined(
            onPressed: onPressed,
            icon: Icon(
              Icons.clear,
              size: 16,
              color: Theme.of(context).colorScheme.error,
            ),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            label: const Text(
              'CLEAR',
              style: TextStyle(fontSize: 14),
            ),
            icon: Icon(Icons.clear,
                size: 16, color: Theme.of(context).colorScheme.error),
          );
  }
}
