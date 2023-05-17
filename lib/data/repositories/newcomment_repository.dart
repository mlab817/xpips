import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

import '../requests/comment_request.dart';
import '../responses/newcomment_response.dart';

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

final newCommentRepositoryProvider = Provider<NewCommentRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return NewCommentRepositoryImplementer(client: client);
});
