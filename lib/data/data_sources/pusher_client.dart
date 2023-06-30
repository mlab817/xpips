import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/config.dart';

part 'pusher_client.g.dart';

@Riverpod(keepAlive: true)
PusherChannelsOptions pusherChannelsOptions(PusherChannelsOptionsRef ref) {
  return PusherChannelsOptions.fromHost(
    // usually: ws or wss
    scheme: 'wss',
    host: ref.watch(configProvider).domain,
    key: '1b421e8d437e47b9eee3',
    // decide if to send additional metadata in query parameters of the url
    shouldSupplyMetadataQueries: true,
    port: 443,
    // apply custom metadata if needed
    metadata: const PusherChannelsOptionsMetadata.byDefault(),
  );
}

@Riverpod(keepAlive: true)
PusherChannelsClient pusherClient(PusherClientRef ref) {
  final client = PusherChannelsClient.websocket(
    options: ref.watch(pusherChannelsOptionsProvider),
    connectionErrorHandler: (exception, trace, refresh) {
      refresh();
    },
  );

  // connect the client
  client.connect();

  // listen for dispose event of ref and dispose client
  ref.onDispose(() {
    client.dispose();
  });

  return client;
}
