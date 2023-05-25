import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    authorizationEndpoint:
        Uri.parse("${Config.baseApiUrl}/api/broadcasting/auth"),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
}
