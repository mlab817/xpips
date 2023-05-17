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
// apply custom metadata if needed
  metadata: PusherChannelsOptionsMetadata.byDefault(),
);

final pusherClientProvider = Provider<PusherChannelsClient>((ref) {
  final client = PusherChannelsClient.websocket(
      options: hostOptions,
      connectionErrorHandler: (exception, trace, refresh) {
        refresh();
      });

  client.connect();

  return client;
});
