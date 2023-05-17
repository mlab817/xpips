import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../application/config.dart';
import '../../application/providers/dio_provider.dart';
import '../../data/requests/pagination_request.dart';
import '../../data/requests/signup_request.dart';
import '../../data/responses/chatrooms_response.dart';
import '../../data/responses/comments_response.dart';
import '../../data/responses/createproject_response.dart';
import '../../data/responses/newcomment_response.dart';
import '../../domain/models/login_credentials.dart';
import '../../domain/models/login_response.dart';
import '../../domain/models/notifications.dart';
import '../requests/comment_request.dart';
import '../requests/fullproject_request.dart';
import '../requests/projects_request.dart';
import '../requests/reactivation_request.dart';
import '../requests/updateprofile_request.dart';
import '../responses/chatroom_response.dart';
import '../responses/deleteproject_response.dart';
import '../responses/notifications_response.dart';
import '../responses/offices_response.dart';
import '../responses/options_response.dart';
import '../responses/pipsstatus_response.dart';
import '../responses/project_response.dart';
import '../responses/projects_response.dart';
import '../responses/reactivation_response.dart';
import '../responses/signup_response.dart';
import '../responses/updateprofile_response.dart';
import '../responses/updateproject_response.dart';
import '../responses/upload_response.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: Config.baseApiUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginCredentials input);

  @GET('/projects')
  Future<ProjectsResponse> getAllProjects(@Queries() ProjectsRequest input);

  @GET('/projects/{uuid}')
  Future<ProjectResponse> getProject(@Path() String uuid);

  @POST('/projects')
  Future<CreateProjectResponse> createProject(
      @Body() FullProjectRequest request);

  /// Notifications API
  @PUT('/projects/{uuid}')
  Future<UpdateProjectResponse> updateProject(
      @Path() String uuid, @Body() FullProjectRequest request);

  @DELETE('/projects/{uuid}')
  Future<DeleteProjectResponse> deleteProject(@Path() String uuid);

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

  @POST("/signup")
  Future<SignupResponse> signup(@Body() SignupRequest input);

  @POST("/upload")
  Future<UploadResponse> upload({
    @Part() required File file,
  });

  @POST('/request-reactivation')
  Future<ReactivationResponse> requestReactivation(
      @Body() ReactivationRequest request);

  @POST('/update-profile')
  Future<UpdateProfileResponse> updateProfile(
      @Body() UpdateProfileRequest request);

  @GET("/projects/{uuid}/comments")
  Future<CommentsResponse> showComments(@Path() String uuid);

  @POST("/projects/{uuid}/comments")
  Future<NewCommentResponse> addComment(
      @Path() String uuid, @Body() CommentRequest comment);
}

final appServiceClientProvider = Provider<AppServiceClient>((ref) {
  print('appServiceClientProvider called');

  final dio = ref.watch(dioProvider);

  print('dio watched');

  return AppServiceClient(dio);
});
