import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../responses/options_response.dart';

part 'options_repository.g.dart';

abstract class OptionsRepository {
  Future<OptionsResponse> get();
}

class OptionsRepositoryImplementer implements OptionsRepository {
  final AppServiceClient client;

  OptionsRepositoryImplementer({required this.client});

  @override
  Future<OptionsResponse> get() async {
    return await client.getOptions();
  }
}

@Riverpod(keepAlive: true)
OptionsRepository optionsRepository(OptionsRepositoryRef ref) =>
    OptionsRepositoryImplementer(client: ref.watch(appServiceClientProvider));
