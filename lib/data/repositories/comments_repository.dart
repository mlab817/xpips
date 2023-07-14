import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/functions.dart';
import '../../data/data_sources/app_service_client.dart';
import '../../application/providers/appserviceclient_provider.dart';
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
    try {
      return await client.showComments(uuid);
    } catch (e) {
      throw formatError(e);
    }
  }
}

@Riverpod(keepAlive: true)
CommentsRepository commentsRepository(CommentsRepositoryRef ref) =>
    CommentsRepositoryImplementer(client: ref.watch(appServiceClientProvider));
