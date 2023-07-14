import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.g.dart';

class Config {
  final String _domain = 'pipsv2.test'; // 'pips.da.gov.ph';

  String get domain => _domain;
  String get baseUrl => 'https://$_domain';
  String get baseApiUrl => 'https://$_domain/api';
  String get wsAuthUrl => "$baseApiUrl/broadcasting/auth";
  String get generatePdfBaseUrl => "$baseUrl/generate-pdf";

  static const String apiUrl = 'https://pipsv2.test/api';
}

@Riverpod(keepAlive: true)
Config config(ConfigRef ref) => Config();
