import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../responses/comments_response.dart';

part 'comments_repository.g.dart';

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

@Riverpod(keepAlive: true)
CommentsRepository commentsRepository(CommentsRepositoryRef ref) =>
    CommentsRepositoryImplementer(client: ref.watch(appServiceClientProvider));
