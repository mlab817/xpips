import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

import '../responses/comments_response.dart';

abstract class CommentsRepository {
  Future<CommentsResponse> showComments(String uuid);
}

class CommentsRepositoryImplementer implements CommentsRepository {
  final AppServiceClient client;

  CommentsRepositoryImplementer({required this.client});

  @override
  Future<CommentsResponse> showComments(String uuid) async {
    return client.showComments(uuid);
  }
}

final commentsRepositoryProvider =
    Provider<CommentsRepositoryImplementer>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return CommentsRepositoryImplementer(client: client);
});
