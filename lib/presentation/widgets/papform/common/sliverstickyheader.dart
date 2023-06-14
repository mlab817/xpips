import 'package:flutter/material.dart';

class SliverStickyHeaderComponent extends StatelessWidget {
  const SliverStickyHeaderComponent({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 18,
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          // TODO: review if this is ok
          ...?actions
        ],
      ),
    );
  }
}
