import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../responses/offices_response.dart';

part 'offices_repository.g.dart';

abstract class OfficesRepository {
  Future<OfficesResponse> get();
}

class OfficesRepositoryImplementer implements OfficesRepository {
  final AppServiceClient client;

  OfficesRepositoryImplementer({required this.client});

  @override
  Future<OfficesResponse> get() async {
    return client.getOffices();
  }
}

@Riverpod(keepAlive: true)
OfficesRepository officesRepository(OfficesRepositoryRef ref) =>
    OfficesRepositoryImplementer(client: ref.watch(appServiceClientProvider));
