import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../application/config.dart';
import '../../application/providers/dio_factory.dart';
import '../../data/responses/chatrooms_response.dart';
import '../../domain/models/login_credentials.dart';
import '../../domain/models/login_response.dart';
import '../../domain/models/notifications.dart';
import '../../domain/models/projects_request.dart';
import '../../domain/models/projects_response.dart';
import '../requests/notifications_request.dart';
import '../responses/chatroom_response.dart';
import '../responses/notifications_response.dart';

part 'network.g.dart';

@RestApi(baseUrl: Config.baseApiUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginCredentials input);

  @GET('/projects')
  Future<ProjectsResponse> getAllProjects(@Body() ProjectsRequest input);

  /// Notifications API

  @GET("/notifications")
  Future<NotificationsResponse> listNotifications(
      @Queries() NotificationsRequest input);

  @POST("/mark-notification-as-read")
  Future<Notification> markNotificationAsRead(@Field("id") String id);

  /// Chats API
  @GET('/chat-rooms')
  Future<ChatRoomsResponse> getChatRooms();

  @GET('/chat-rooms/{id}')
  Future<ChatRoomResponse> getChatRoom(@Path('id') int id);
}

final appServiceClientProvider = Provider<AppServiceClient>((ref) {
  final dio = ref.watch(dioProvider);

  return AppServiceClient(dio);
});
