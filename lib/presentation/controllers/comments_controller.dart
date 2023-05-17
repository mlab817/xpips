import 'dart:async';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/config.dart';
import 'package:pips/application/providers/bearertoken_provider.dart';
import 'package:pips/data/data_sources/pusher_client.dart';
import 'package:pips/data/repositories/comments_repository.dart';
import 'package:pips/data/responses/comments_response.dart';
import 'package:pips/domain/models/comment.dart';

// fetch all comments
class CommentsController
    extends AutoDisposeFamilyAsyncNotifier<CommentsResponse, String> {
  Future<CommentsResponse> get(String uuid) async {
    final repository = ref.watch(commentsRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.showComments(uuid));

    return await repository.showComments(uuid);
  }

  @override
  FutureOr<CommentsResponse> build(String arg) async => get(arg);
}

final commentsControllerProvider = AutoDisposeAsyncNotifierProviderFamily<
    CommentsController, CommentsResponse, String>(() {
  return CommentsController();
});

// listen to real time comments
final realTimeCommentsProvider = StreamProvider.autoDispose((ref) {
  final token = ref.watch(bearerTokenNotifierProvider);

  final channel = ref.watch(pusherClientProvider);
  final subscription = channel
      .privateChannel(
        'comments',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate
                .forPrivateChannel(
          authorizationEndpoint:
              Uri.parse("${Config.baseApiUrl}/api/broadcasting/auth"),
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      )
      .bind('comments.added');

  final streamController = StreamController();

  subscription.listen((event) {
    final comment = Comment.fromJson(event.data);
    print(comment.toString());
  });

  ref.onDispose(() {
    streamController.close();
    channel.dispose();
  });

  return streamController.stream;
});
