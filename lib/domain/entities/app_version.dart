class AppVersion {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  AppVersion({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });

  String toAppVersionName() {
    return "$appName $packageName $version $buildNumber";
  }
}
