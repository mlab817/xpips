import 'package:flutter/material.dart';

class SliverStickyHeaderComponent extends StatelessWidget {
  const SliverStickyHeaderComponent({
    super.key,
    required this.icon,
    required this.title,
    this.color,
    this.actions,
  });

  final IconData icon;
  final String title;
  final Color? color;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: color ?? Theme.of(context).primaryColor.withAlpha(200),
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
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
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
