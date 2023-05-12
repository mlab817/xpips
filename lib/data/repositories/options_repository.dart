import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

import '../responses/options_response.dart';

abstract class OptionsRepository {
  Future<OptionsResponse> get();
}

class OptionsRepositoryImplementer implements OptionsRepository {
  final AppServiceClient client;

  OptionsRepositoryImplementer(this.client);

  @override
  Future<OptionsResponse> get() async {
    return await client.getOptions();
  }
}

final optionsRepositoryProvider = Provider<OptionsRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return OptionsRepositoryImplementer(client);
});
