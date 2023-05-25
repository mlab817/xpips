// listen to real time comments
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/pusher_client.dart';

part 'realtimecomments_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<ChannelReadEvent> realTimeCommentsStream(RealTimeCommentsStreamRef ref,
    {required String uuid}) {
  final PusherChannelsClient client = ref.watch(pusherClientProvider);

  final String channel = "projects.$uuid.comments";

  // declare and create the channel
  final PublicChannel commentsChannel = client.publicChannel(
    channel,
  );

  // subscribe to the channel once connection is established
  client.onConnectionEstablished.listen((event) {
    commentsChannel.subscribeIfNotUnsubscribed();
  });

  // unsubscribe from the channel when the ref has been disposed
  ref.onDispose(() => commentsChannel.unsubscribe());

  // listen to events
  return commentsChannel.bind('comments.added');
}
