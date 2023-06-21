import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';
import '../responses/responses.dart';

part 'pipolstatus_repository.g.dart';

abstract class PipolStatusRepository {
  Future<PipolStatusResponse> getPipolStatuses();
}

class PipolStatusRepositoryImplementer implements PipolStatusRepository {
  final AppServiceClient client;

  PipolStatusRepositoryImplementer({
    required this.client,
  });

  @override
  Future<PipolStatusResponse> getPipolStatuses() async {
    return client.getPipolStatuses();
  }
}

@Riverpod(keepAlive: true)
PipolStatusRepository pipolStatusRepository(PipolStatusRepositoryRef ref) =>
    PipolStatusRepositoryImplementer(
        client: ref.watch(appServiceClientProvider));
