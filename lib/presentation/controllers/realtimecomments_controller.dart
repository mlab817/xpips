// listen to real time comments
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/pusher_client.dart';

part 'realtimecomments_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<ChannelReadEvent> realTimeCommentsStream(RealTimeCommentsStreamRef ref,
    {required String uuid}) {
// ignore: avoid_manual_providers_as_generated_provider_dependency
  final client = ref.watch(pusherClientProvider);

  client.connect();

  final String channel = "projects.$uuid.comments";

  final commentsChannel = client.publicChannel(
    channel,
  );

  // subscribe to the channel
  client.onConnectionEstablished.listen((event) {
    commentsChannel.subscribeIfNotUnsubscribed();
  });

  // listen to events
  return commentsChannel.bind('comments.added');
}
