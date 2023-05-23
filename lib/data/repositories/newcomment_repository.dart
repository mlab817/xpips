import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:pips/presentation/controllers/viewpap_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../requests/comment_request.dart';
import '../responses/newcomment_response.dart';

part 'newcomment_repository.g.dart';

abstract class NewCommentRepository {
  Future<NewCommentResponse> addComment(CommentRequest request);
}

class NewCommentRepositoryImplementer implements NewCommentRepository {
  final AppServiceClient client;
  final String uuid;

  NewCommentRepositoryImplementer({required this.client, required this.uuid});

  @override
  Future<NewCommentResponse> addComment(CommentRequest request) async {
    return client.addComment(uuid, request);
  }
}

@riverpod
NewCommentRepository newCommentRepository(NewCommentRepositoryRef ref,
        {required String uuid}) =>
    NewCommentRepositoryImplementer(
      uuid: uuid,
      client: ref.watch(appServiceClientProvider),
    );
