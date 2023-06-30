// TODO: review for deletion
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../../domain/models/chatroom.dart';
import '../../domain/models/message.dart';
import '../data_sources/app_service_client.dart';
import '../requests/chats_request.dart';
import '../requests/newmessage_request.dart';
import '../requests/users_request.dart';
import '../responses/chatroom_response.dart';
import '../responses/chatrooms_response.dart';
import '../responses/messages_response.dart';
import '../responses/users_response.dart';

part 'chat_repository.g.dart';

abstract class ChatRepository {
  Future<ChatRoomsResponse> get(ChatsRequest request);

  Future<ChatRoomsResponse> getChatRooms();

  Future<ChatRoomResponse> getChatRoom(int chatRoomId);

  // TODO: replace with chatroomresponse
  Future<ChatRoom> createChatRoom(int userId);

  // TODO: replace with message response
  Future<Message> createMessage(NewMessageRequest input);

  Future<MessagesResponse> listMessages(int chatRoomId);

  Future<ChatRoomResponse> getChatRoomByUserId(int userId);

  Future<UsersResponse> getUsers(UsersRequest request);
}

class ChatRepositoryImplementer implements ChatRepository {
  final AppServiceClient client;

  ChatRepositoryImplementer({required this.client});

  @override
  Future<ChatRoomsResponse> get(ChatsRequest request) async {
    return client.getChats(request);
  }

  @override
  Future<ChatRoom> createChatRoom(int userId) {
    // TODO: implement createChatRoom
    throw UnimplementedError();
  }

  @override
  Future<Message> createMessage(NewMessageRequest input) {
    // TODO: implement createMessage
    throw UnimplementedError();
  }

  @override
  Future<ChatRoomResponse> getChatRoom(int chatRoomId) {
    return client.getChatRoom(chatRoomId);
  }

  @override
  Future<ChatRoomResponse> getChatRoomByUserId(int userId) {
    // TODO: implement getChatRoomByUserId
    throw UnimplementedError();
  }

  @override
  Future<ChatRoomsResponse> getChatRooms() async {
    return client.getChatRooms();
  }

  @override
  Future<UsersResponse> getUsers(UsersRequest request) {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<MessagesResponse> listMessages(int chatRoomId) {
    // TODO: implement listMessages
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
ChatRepository chatRepository(ChatRepositoryRef ref) =>
    ChatRepositoryImplementer(client: ref.watch(appServiceClientProvider));
