import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
