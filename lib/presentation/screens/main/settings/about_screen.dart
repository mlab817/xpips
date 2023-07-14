import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/appversion_provider.dart';
import 'package:universal_io/io.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isAndroid
          ? AppBar(
              title: const Text('About'),
            )
          : null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _buildLogo(),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                  'The Public Investment Program System, or PIPS, is the official database system of the Department of Agriculture to facilitate the submission of priority programs and projects for inclusion in the Public Investment Program and Three-Year Rolling Infrastructure Program.'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  'It was built using PHP-Laravel for the backend and Dart-Flutter for the cross-platform apps.'),
              const Spacer(),
              const Center(
                  child:
                      Text('Developed by Mark Lester Bolotaolo of the IPD.')),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      ref.watch(appVersionProvider).value?.toAppVersionName() ??
                          ''),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 200,
      width: 235,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              'assets/da.png',
              height: 150,
              width: 150,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipOval(
              child: Image.asset(
                'assets/logo.png',
                height: 120,
                width: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
