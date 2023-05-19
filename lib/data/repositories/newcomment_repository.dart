import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

import '../requests/comment_request.dart';
import '../responses/newcomment_response.dart';

part 'newcomment_repository.g.dart';

abstract class NewCommentRepository {
  Future<NewCommentResponse> addComment(String uuid, CommentRequest request);
}

class NewCommentRepositoryImplementer implements NewCommentRepository {
  final AppServiceClient client;

  NewCommentRepositoryImplementer({required this.client});

  @override
  Future<NewCommentResponse> addComment(
      String uuid, CommentRequest request) async {
    return client.addComment(uuid, request);
  }
}

@riverpod
NewCommentRepository newCommentRepository(NewCommentRepositoryRef ref) =>
    NewCommentRepositoryImplementer(
        client: ref.watch(appServiceClientProvider));
