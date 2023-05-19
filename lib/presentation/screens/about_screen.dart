import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? _appName;
  String? _packageName;
  String? _version;
  String? _buildNumber;
  String? _error;

  Future<void> _getVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      setState(() {
        _appName = packageInfo.appName ?? 'PIPS';
        _packageName = packageInfo.packageName ?? 'com.mlab817.pips';
        _version = packageInfo.version ?? '1.0.0';
        _buildNumber = packageInfo.buildNumber ?? '1';
      });
    } catch (err) {
      setState(() {
        _error = err.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Expanded(child: Text('About')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _error != null
                  ? Text(_error!)
                  : Text("$_appName v$_version build $_buildNumber"),
            ),
          ],
        ),
      ),
    );
  }
}
