// listen to real time comments
import 'dart:convert';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/controllers/comments_controller.dart';

import '../../application/config.dart';
import '../../application/providers/bearertoken_provider.dart';
import '../../data/data_sources/pusher_client.dart';
import '../../domain/models/comment.dart';

final endpointAuthorizationDelegateProvider = Provider<
    EndpointAuthorizableChannelTokenAuthorizationDelegate<
        PrivateChannelAuthorizationData>>((ref) {
  final token = ref.watch(bearerTokenProvider);

  return EndpointAuthorizableChannelTokenAuthorizationDelegate
      .forPrivateChannel(
    authorizationEndpoint:
        Uri.parse("${Config.baseApiUrl}/api/broadcasting/auth"),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
});

final realTimeCommentsProvider =
    StreamProvider.family<List<Comment>, String>((ref, uuid) async* {
  print('real time comments provider init');

  final endpointAuthorization =
      ref.watch(endpointAuthorizationDelegateProvider);

  final client = ref.watch(pusherClientProvider);

  client.connect();

  // initialize an empty comments list
  List<Comment> comments = <Comment>[];

  // get the comments from repository
  final commentsRef = ref.watch(commentsControllerProvider(uuid: uuid));

  if (commentsRef.value != null) {
    comments = commentsRef.value?.data ?? [];
  }

  final commentsChannel = client.privateChannel(
    'comments',
    authorizationDelegate: endpointAuthorization,
  );

  // upon established connection, subscribe to channel
  client.onConnectionEstablished.listen((_) {
    print(
        'on connection established triggered: subscribing to comments channel---');
    commentsChannel.subscribeIfNotUnsubscribed();
  });

  commentsChannel.bind('pusher:subscription_succeeded').listen((event) {
    print('successfully subscribed to :comments channel');
  });

  // bind to event
  final subscription = commentsChannel.bind('comments.added').listen(
    (event) {
      print(event.toDebugString());

      final comment = Comment.fromJson(event.data);

      comments = [...comments, comment];
    },
  );

  ref.onDispose(() {
    subscription.cancel();
    print('ref disposed');
  });

  yield comments;
});

extension ChannelReadEventToString on ChannelReadEvent {
  @override
  String toDebugString() {
    return jsonEncode(this);
  }
}
