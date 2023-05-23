import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/app_service_client.dart';
import '../../data/network/dio.dart';

part 'appserviceclient_provider.g.dart';

@Riverpod(keepAlive: true)
AppServiceClient appServiceClient(AppServiceClientRef ref) {
  final dio = ref.watch(dioProvider);

  print('dio watched');

  return AppServiceClient(dio);
}
