import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.g.dart';

class Config {
  final String _domain = 'pipsv2.test';
  final String _oneSignalAppId = 'f601fb30-7df7-437e-a51f-be3f72997245';

  String get domain => _domain;
  String get baseUrl => 'https://$domain';
  String get baseApiUrl => 'https://$domain/api';
  String get wsAuthUrl => "$baseApiUrl/api/broadcasting/auth";
  String get generatePdfBaseUrl => "$baseUrl/generate-pdf/";
  String get oneSignalAppId => _oneSignalAppId;

  static const String apiUrl = 'https://pipsv2.test/api';
}

@Riverpod(keepAlive: true)
Config config(ConfigRef ref) => Config();
