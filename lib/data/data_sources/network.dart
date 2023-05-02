import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:xpips/application/providers/dio_factory.dart';
import 'package:xpips/domain/models/login_credentials.dart';

import '../../application/config.dart';
import '../../domain/models/login_response.dart';

part 'network.g.dart';

@RestApi(baseUrl: Config.baseApiUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginCredentials input);
}

final appServiceClientProvider = Provider<AppServiceClient>((ref) {
  final dio = ref.watch(dioProvider);

  return AppServiceClient(dio);
});
