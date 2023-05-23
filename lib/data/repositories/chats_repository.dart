import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';
import '../requests/requests.dart';
import '../responses/responses.dart';

abstract class ChatsRepository {
  Future<ChatRoomsResponse> get(ProjectsRequest request);
}

class ChatsRepositoryImplementer implements ChatsRepository {
  final AppServiceClient client;

  ChatsRepositoryImplementer({required this.client});

  @override
  Future<ChatRoomsResponse> get(ProjectsRequest request) async {
    return client.getChats(request);
  }
}

final chatsRepositoryProvider = Provider<ChatsRepository>((ref) {
  return ChatsRepositoryImplementer(
      client: ref.watch(appServiceClientProvider));
});
