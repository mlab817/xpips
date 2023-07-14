import 'package:pips/application/providers/appserviceclient_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/functions.dart';
import '../data_sources/app_service_client.dart';
import '../responses/deadline_response.dart';

part 'deadline_repository.g.dart';

/// Repository for retrieving information on the deadline of submission of PAPs
class DeadlineRepository {
  final AppServiceClient client;

  DeadlineRepository({required this.client});

  Future<DeadlineResponse> get() async {
    try {
      return await client.deadline();
    } catch (e) {
      throw formatError(e);
    }
  }
}

@Riverpod(keepAlive: true)
DeadlineRepository deadlineRepository(DeadlineRepositoryRef ref) =>
    DeadlineRepository(client: ref.watch(appServiceClientProvider));
