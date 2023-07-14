import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/functions.dart';
import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';
import '../requests/requests.dart';
import '../responses/responses.dart';

part 'chat_repository.g.dart';

abstract class ChatRepository {
  Future<ChatRoomsResponse> get(ChatsRequest request);

  Future<ChatRoomsResponse> getChatRooms();

  Future<ChatRoomResponse> getChatRoom(int chatRoomId);
}

class ChatRepositoryImplementer implements ChatRepository {
  final AppServiceClient client;

  ChatRepositoryImplementer({required this.client});

  @override
  Future<ChatRoomsResponse> get(ChatsRequest request) async {
    try {
      return await client.getChats(request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ChatRoomResponse> getChatRoom(int chatRoomId) async {
    return await client.getChatRoom(chatRoomId);
  }

  @override
  Future<ChatRoomsResponse> getChatRooms() async {
    return await client.getChatRooms();
  }
}

@Riverpod(keepAlive: true)
ChatRepository chatRepository(ChatRepositoryRef ref) =>
    ChatRepositoryImplementer(client: ref.watch(appServiceClientProvider));
