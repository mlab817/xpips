import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

import '../../application/functions.dart';
import '../../application/providers/appserviceclient_provider.dart';
import '../responses/pipsstatus_response.dart';

abstract class PipsStatusRepository {
  Future<PipsStatusResponse> getAll();
}

class PipsStatusRepositoryImplementer implements PipsStatusRepository {
  final AppServiceClient client;

  PipsStatusRepositoryImplementer({required this.client});

  @override
  Future<PipsStatusResponse> getAll() async {
    try {
      return await client.getPipsStatuses();
    } catch (e) {
      throw formatError(e);
    }
  }
}

final pipsStatusRepositoryProvider = Provider<PipsStatusRepository>((ref) {
  return PipsStatusRepositoryImplementer(
      client: ref.watch(appServiceClientProvider));
});
