import 'package:pips/data/requests/chats_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';
import '../responses/responses.dart';

part 'chats_repository.g.dart';

abstract class ChatsRepository {
  Future<ChatRoomsResponse> get(ChatsRequest request);
}

class ChatsRepositoryImplementer implements ChatsRepository {
  final AppServiceClient client;

  ChatsRepositoryImplementer({required this.client});

  @override
  Future<ChatRoomsResponse> get(ChatsRequest request) async {
    return client.getChats(request);
  }
}

@Riverpod(keepAlive: true)
ChatsRepository chatsRepository(ChatsRepositoryRef ref) {
  return ChatsRepositoryImplementer(
      client: ref.watch(appServiceClientProvider));
}
