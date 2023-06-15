import 'dart:io';

import 'package:dio/dio.dart';
import '../../data/requests/chats_request.dart';
import '../../data/requests/updatepassword_request.dart';
import 'package:retrofit/retrofit.dart';

import '../../application/config.dart';
import '../../data/requests/pagination_request.dart';
import '../../data/requests/signup_request.dart';
import '../../data/responses/chatrooms_response.dart';
import '../../data/responses/comments_response.dart';
import '../../data/responses/createproject_response.dart';
import '../../data/responses/newcomment_response.dart';
import '../../domain/models/cost_schedule.dart';
import '../../domain/models/fs_investment.dart';
import '../../domain/models/login_credentials.dart';
import '../../domain/models/notifications.dart';
import '../../domain/models/regional_investment.dart';
import '../repositories/pipolstatus_repository.dart';
import '../requests/comment_request.dart';
import '../requests/fullproject_request.dart';
import '../requests/newproject_request.dart';
import '../requests/notifications_request.dart';
import '../requests/projects_request.dart';
import '../requests/reactivation_request.dart';
import '../requests/updateprofile_request.dart';
import '../responses/chatroom_response.dart';
import '../responses/deleteproject_response.dart';
import '../responses/login_response.dart';
import '../responses/notifications_response.dart';
import '../responses/offices_response.dart';
import '../responses/options_response.dart';
import '../responses/patchproject_response.dart';
import '../responses/pipsstatus_response.dart';
import '../responses/project_response.dart';
import '../responses/projects_response.dart';
import '../responses/reactivation_response.dart';
import '../responses/signup_response.dart';
import '../responses/status_response.dart';
import '../responses/updatefinancialaccomplishment_response.dart';
import '../responses/updateprofile_response.dart';
import '../responses/updateproject_response.dart';
import '../responses/upload_response.dart';
import '../responses/uploadattachment_response.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: Config.apiUrl)
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
      @Body() NewProjectRequest request);

  /// Notifications API
  @PUT('/projects/{uuid}')
  Future<UpdateProjectResponse> updateProject(
      @Path() String uuid, @Body() FullProjectRequest request);

  @PATCH('/projects/{uuid}')
  Future<PatchProjectResponse> patchProject(
      @Path() String uuid, @Body() Map<String, dynamic> data);

  @DELETE('/projects/{uuid}')
  Future<DeleteProjectResponse> deleteProject(@Path() String uuid);

  @GET("/notifications")
  Future<NotificationsResponse> listNotifications(
      @Queries() NotificationsRequest input);

  @POST("/mark-notification-as-read")
  Future<Notifications> markNotificationAsRead(@Field("id") String id);

  /// Chats API
  @GET('/chat-rooms')
  Future<ChatRoomsResponse> getChatRooms();

  @GET('/chat-rooms/{id}')
  Future<ChatRoomResponse> getChatRoom(@Path('id') int id);

  @GET('/chats')
  Future<ChatRoomsResponse> getChats(@Queries() ChatsRequest request);

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
    @SendProgress() ProgressCallback? sendProgress,
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

  @MultiPart()
  @POST("/upload-avatar")
  Future<void> uploadAvatar(@Part(name: 'avatar') File request);

  @POST('/update-password')
  Future<void> updatePassword(@Body() UpdatePasswordRequest request);

  @GET('/pipol-statuses')
  Future<PipolStatusResponse> getPipolStatuses();

  @POST('/projects/{uuid}/financial-accomplishment')
  Future<UpdateFinancialAccomplishmentResponse> updateFinancialAccomplishment(
      @Path('uuid') String uuid, @Body() Map<String, dynamic> payload);

  @POST('/projects/{uuid}/row')
  Future<StatusResponse> updateRow(
      @Path('uuid') String uuid, @Body() CostSchedule request);

  @POST('/projects/{uuid}/rap')
  Future<StatusResponse> updateRap(
      @Path('uuid') String uuid, @Body() CostSchedule request);

  @POST('/projects/{uuid}/fs')
  Future<StatusResponse> updateFs(
      @Path('uuid') String uuid, @Body() CostSchedule request);

  @POST('/projects/{uuid}/regional-investments')
  Future<RegionalInvestmentResponse> updateRegionalInvestment(
      @Path('uuid') String uuid, @Body() RegionalInvestment request);

  @POST('/projects/{uuid}/fs-investments')
  Future<FsInvestmentResponse> updateFsInvestment(
      @Path('uuid') String uuid, @Body() FsInvestment request);

  @DELETE('/regional-investments/{id}')
  Future<void> removeRegionalInvestment(@Path('id') int id);

  @DELETE('/fs-investments/{id}')
  Future<void> removeFsInvestment(@Path('id') int id);

  @POST('/projects/{uuid}/attachments')
  Future<UploadAttachmentResponse> attach(
    @Path('uuid') String uuid, {
    @Part(name: 'attachment') required File attachment,
    @Part(name: 'attachment_type_id') required int attachmentTypeId,
  });
}
