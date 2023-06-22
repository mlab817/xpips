import 'package:flutter/material.dart';

class FormSectionHeader extends StatelessWidget {
  const FormSectionHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
