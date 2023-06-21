import 'package:pips/application/providers/appserviceclient_provider.dart';
import 'package:pips/data/responses/updatingperiod_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_sources/app_service_client.dart';

part 'updatingperiod_repository.g.dart';

class UpdatingPeriodRepository {
  final AppServiceClient client;

  UpdatingPeriodRepository({required this.client});

  Future<UpdatingPeriodResponse> get() async => client.updatingPeriod();
}

@Riverpod(keepAlive: true)
UpdatingPeriodRepository updatingPeriodRepository(
    UpdatingPeriodRepositoryRef ref) {
  return UpdatingPeriodRepository(client: ref.watch(appServiceClientProvider));
}
