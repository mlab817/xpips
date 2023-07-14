import 'package:flutter/material.dart';

/// Decide whether to render a Column or Row depending on screen width
/// Render Column if screen width <= 1080 else render Row
class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width <= 1080) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
