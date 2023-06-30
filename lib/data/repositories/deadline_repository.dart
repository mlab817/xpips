import 'package:pips/application/providers/appserviceclient_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_sources/app_service_client.dart';
import '../responses/deadline_response.dart';

part 'deadline_repository.g.dart';

/// Repository for retrieving information on the deadline of submission of PAPs
class DeadlineRepository {
  final AppServiceClient client;

  DeadlineRepository({required this.client});

  Future<DeadlineResponse> get() async => client.deadline();
}

@Riverpod(keepAlive: true)
DeadlineRepository deadlineRepository(DeadlineRepositoryRef ref) {
  return DeadlineRepository(client: ref.watch(appServiceClientProvider));
}
