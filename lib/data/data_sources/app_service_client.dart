import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../application/config.dart';
import '../../data/requests/requests.dart';
import '../../data/responses/responses.dart';
import '../../domain/models/models.dart';
import '../requests/login_request.dart';
import '../responses/user_response.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: Config.apiUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginRequest input);

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

  @POST('/projects/{uuid}/clone')
  Future<ProjectResponse> clone(@Path('uuid') String uuid);

  @GET('/search')
  Future<ProjectsResponse> search(@Query('q') String query);

  @GET('/me')
  Future<UserResponse> getCurrentUser();

  @GET('/deadline')
  Future<DeadlineResponse> deadline();

  @GET('/updating-period')
  Future<UpdatingPeriodResponse> updatingPeriod();

  @GET('/archived')
  Future<ProjectsResponse> getArchived(@Queries() ArchiveRequest input);

  @GET('/projects/{uuid}/evaluation-reports')
  Future<EvaluationReportResponse> getEvaluation(
      {@Path('uuid') required String uuid});

  @POST('/projects/{uuid}/evaluation-reports')
  Future<EvaluationReportResponse> postEvaluation({
    @Path('uuid') required String uuid,
    @Body() required EvaluationReport request,
  });

  @PUT('evaluation-reports/{id}')
  Future<EvaluationReportResponse> putEvaluation({
    @Path('uuid') required int id,
    @Body() required EvaluationReport request,
  });

  @DELETE('evaluation-reports/{id}')
  Future<EvaluationReportResponse> deleteEvaluation(
      {@Path('uuid') required int id});
}
