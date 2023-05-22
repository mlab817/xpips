import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/models/models.dart';

final appVersionProvider = FutureProvider<AppVersion>((ref) async {
  try {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return AppVersion(
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
    );
  } catch (err) {
    return AppVersion(
      appName: 'PIPS',
      packageName: 'com.mlab817.pips',
      version: '1.0.0',
      buildNumber: '1',
    );
  }
});
