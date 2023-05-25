import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:pips/data/data_sources/pusher_client.dart';
import 'package:pips/domain/models/models.dart';
import 'package:pips/presentation/controllers/currentuser_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/websockets_authorization.dart';

part 'notificationsstream_controller.g.dart';

@Riverpod(keepAlive: true)
Stream<ChannelReadEvent> notificationsStream(NotificationsStreamRef ref) {
  final PusherChannelsClient client = ref.watch(pusherClientProvider);
  final User? currentUser = ref.watch(currentUserProvider);

  final String channelName = "users.${currentUser?.uuid}.notifications";

  final PrivateChannel privateChannel = client.privateChannel(channelName,
      authorizationDelegate: ref.watch(endpointAuthorizationDelegateProvider));

  client.onConnectionEstablished.listen((_) {
    print('subscribing to $channelName');

    privateChannel.subscribeIfNotUnsubscribed();

    print('subscribed to $channelName');
  });

  // unsubscribe from the channel when the ref has been disposed
  ref.onDispose(() => privateChannel.unsubscribe());

  return privateChannel.bind('notifications.added');
}
