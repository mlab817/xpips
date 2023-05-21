import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/config.dart';

const hostOptions = PusherChannelsOptions.fromHost(
// usually: ws or wss
  scheme: 'wss',
  host: Config.domain,
  key: '1b421e8d437e47b9eee3',
// decide if to send additional metadata in query parameters of the url
  shouldSupplyMetadataQueries: true,
  port: 443,
// apply custom metadata if needed
  metadata: PusherChannelsOptionsMetadata.byDefault(),
);

final pusherClientProvider = Provider<PusherChannelsClient>((ref) {
  print('pusher client init');

  final client = PusherChannelsClient.websocket(
    options: hostOptions,
    connectionErrorHandler: (exception, trace, refresh) {
      print(exception);
      print(trace);
      refresh();
    },
  );

  final publicChannels = <Channel>[
    client.publicChannel('PIPSv3.Public'),
  ];

  final subscriptions = client.onConnectionEstablished.listen((_) {
    for (var channel in publicChannels) {
      channel.subscribeIfNotUnsubscribed();
    }
  });

  publicChannels.first.bind('pusher:subscription_succeeded').listen((_) {
    print('subscription succeeded');
  });

  publicChannels.first.bindToAll().listen((event) {
    // do something
    print(event.data.toString());
  });

  client.connect();

  ref.onDispose(() {
    client.dispose();
  });

  return client;
});
