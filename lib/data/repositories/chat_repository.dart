import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/network.dart';
import '../../domain/models/chatroom.dart';
import '../../domain/models/message.dart';
import '../requests/newmessage_request.dart';
import '../requests/users_request.dart';
import '../responses/chatroom_response.dart';
import '../responses/chatrooms_response.dart';
import '../responses/messages_response.dart';
import '../responses/users_response.dart';

abstract class ChatRepository {
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
  final AppServiceClient _client;

  ChatRepositoryImplementer(this._client);

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
    return _client.getChatRoom(chatRoomId);
  }

  @override
  Future<ChatRoomResponse> getChatRoomByUserId(int userId) {
    // TODO: implement getChatRoomByUserId
    throw UnimplementedError();
  }

  @override
  Future<ChatRoomsResponse> getChatRooms() async {
    return _client.getChatRooms();
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

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return ChatRepositoryImplementer(client);
});
