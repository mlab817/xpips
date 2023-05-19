import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/theme_provider.dart';

class PreferencesScreen extends ConsumerStatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends ConsumerState<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListView(
            shrinkWrap: true,
            children: [
              SwitchListTile(
                title: const Text('Theme'),
                subtitle: Text(ref.watch(themeProvider).name.toUpperCase()),
                value: ref.watch(themeProvider) == ThemeMode.dark,
                onChanged: (bool value) {
                  ref.read(themeProvider.notifier).switchTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
