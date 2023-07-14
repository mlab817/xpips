// listen to real time updates
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/pusher_client.dart';

part 'realtimepapupdates_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<ChannelReadEvent> realTimePapUpdatesStream(
    RealTimePapUpdatesStreamRef ref,
    {required String uuid}) {
  final PusherChannelsClient client = ref.watch(pusherClientProvider);

  client.connect();

  final String channelName = "projects.$uuid.updates";

  // declare and create the channel
  final PublicChannel channel = client.publicChannel(
    channelName,
  );

  // subscribe to the channel once connection is established
  client.onConnectionEstablished.listen((event) {
    print('subscribing to $channelName');

    channel.subscribeIfNotUnsubscribed();

    print('subscribed to $channelName');
  });

  // unsubscribe from the channel when the ref has been disposed
  ref.onDispose(() => channel.unsubscribe());

  // listen to events
  return channel.bind('projects.updated');
}
