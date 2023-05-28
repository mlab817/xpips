import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config.dart';
import 'bearertoken_provider.dart';

part 'websockets_authorization.g.dart';

@Riverpod(keepAlive: true)
EndpointAuthorizableChannelTokenAuthorizationDelegate<
        PrivateChannelAuthorizationData>
    endpointAuthorizationDelegate(EndpointAuthorizationDelegateRef ref) {
  final token = ref.watch(bearerTokenProvider);

  return EndpointAuthorizableChannelTokenAuthorizationDelegate
      .forPrivateChannel(
    authorizationEndpoint: Uri.parse(ref.watch(configProvider).wsAuthUrl),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
}
