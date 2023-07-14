import 'package:pips/application/providers/appserviceclient_provider.dart';
import 'package:pips/data/responses/updatingperiod_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/functions.dart';
import '../data_sources/app_service_client.dart';

part 'updatingperiod_repository.g.dart';

class UpdatingPeriodRepository {
  final AppServiceClient client;

  UpdatingPeriodRepository({required this.client});

  Future<UpdatingPeriodResponse> get() async {
    try {
      return await client.updatingPeriod();
    } catch (e) {
      throw formatError(e);
    }
  }
}

@Riverpod(keepAlive: true)
UpdatingPeriodRepository updatingPeriodRepository(
        UpdatingPeriodRepositoryRef ref) =>
    UpdatingPeriodRepository(client: ref.watch(appServiceClientProvider));
