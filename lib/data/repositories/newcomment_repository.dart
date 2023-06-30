import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../requests/comment_request.dart';
import '../responses/newcomment_response.dart';

part 'newcomment_repository.g.dart';

abstract class NewCommentRepository {
  /// Add a new comment to a project based on uuid
  ///
  /// The `uuid` argument is a String id of the Project.
  ///
  /// The `CommentRequest` argument is a simple class that contains the String `comment`.
  Future<NewCommentResponse> addComment(String uuid, CommentRequest request);
}

class NewCommentRepositoryImplementer implements NewCommentRepository {
  final AppServiceClient client;

  NewCommentRepositoryImplementer({
    required this.client,
  });

  @override
  Future<NewCommentResponse> addComment(
      String uuid, CommentRequest request) async {
    return client.addComment(uuid, request);
  }
}

@Riverpod(keepAlive: true)
NewCommentRepository newCommentRepository(NewCommentRepositoryRef ref,
        {required String uuid}) =>
    NewCommentRepositoryImplementer(
      client: ref.watch(appServiceClientProvider),
    );
