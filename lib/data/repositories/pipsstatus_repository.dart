import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

import '../responses/pipsstatus_response.dart';

abstract class PipsStatusRepository {
  Future<PipsStatusResponse> getAll();
}

class PipsStatusRepositoryImplementer implements PipsStatusRepository {
  final AppServiceClient client;

  PipsStatusRepositoryImplementer(this.client);

  @override
  Future<PipsStatusResponse> getAll() async {
    return await client.getPipsStatuses();
  }
}

final pipsStatusRepositoryProvider = Provider<PipsStatusRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return PipsStatusRepositoryImplementer(client);
});
