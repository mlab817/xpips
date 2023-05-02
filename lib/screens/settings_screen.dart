import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> _menu = [
    'Update Profile',
    'Update Password',
    'Account Recovery',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _menu.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_menu[index]),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: add navigation
                },
              );
            },
          ),
          FilledButton(
              onPressed: () {
                // TODO: handle logout
              },
              child: const Text('Logout'))
        ],
      ),
    );
  }
}
