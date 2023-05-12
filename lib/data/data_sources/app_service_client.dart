import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/requests/pagination_request.dart';
import 'package:retrofit/http.dart';

import '../../application/config.dart';
import '../../application/providers/dio_provider.dart';
import '../../data/responses/chatrooms_response.dart';
import '../../domain/models/login_credentials.dart';
import '../../domain/models/login_response.dart';
import '../../domain/models/notifications.dart';
import '../../domain/models/projects_request.dart';
import '../../domain/models/projects_response.dart';
import '../requests/signup_request.dart';
import '../responses/chatroom_response.dart';
import '../responses/notifications_response.dart';
import '../responses/offices_response.dart';
import '../responses/options_response.dart';
import '../responses/pipsstatus_response.dart';
import '../responses/signup_response.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: Config.baseApiUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginCredentials input);

  @GET('/projects')
  Future<ProjectsResponse> getAllProjects(@Queries() ProjectsRequest input);

  /// Notifications API

  @GET("/notifications")
  Future<NotificationsResponse> listNotifications(
      @Queries() PaginationRequest input);

  @POST("/mark-notification-as-read")
  Future<Notification> markNotificationAsRead(@Field("id") String id);

  /// Chats API
  @GET('/chat-rooms')
  Future<ChatRoomsResponse> getChatRooms();

  @GET('/chat-rooms/{id}')
  Future<ChatRoomResponse> getChatRoom(@Path('id') int id);

  @GET('/pips-statuses')
  Future<PipsStatusResponse> getPipsStatuses();

  @GET('/all-options')
  Future<OptionsResponse> getOptions();

  @GET('/all-offices')
  Future<OfficesResponse> getOffices();

  @MultiPart()
  @POST("/signup")
  Future<SignupResponse> signup(@Body() SignupRequest formData);
}

final appServiceClientProvider = Provider<AppServiceClient>((ref) {
  print('appServiceClientProvider called');

  final dio = ref.watch(dioProvider);

  print('dio watched');

  return AppServiceClient(dio);
});
