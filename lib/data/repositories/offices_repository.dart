import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

import '../responses/offices_response.dart';

abstract class OfficesRepository {
  Future<OfficesResponse> get();
}

class OfficesRepositoryImplementer implements OfficesRepository {
  final AppServiceClient client;

  OfficesRepositoryImplementer(this.client);

  @override
  Future<OfficesResponse> get() async {
    return client.getOffices();
  }
}

final officesRepositoryProvider = Provider<OfficesRepository>((ref) {
  final client = ref.watch<AppServiceClient>(appServiceClientProvider);

  return OfficesRepositoryImplementer(client);
});
