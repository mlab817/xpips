import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/config.dart';
import '../../application/providers/bearertoken_provider.dart';

part 'dio.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  Dio dio = Dio();

  // retrieve token from shared_prefs
  final token = ref.watch(bearerTokenProvider);

  if (kDebugMode) {
    print("token $token");
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${token.toString()}',
  };

  // this will also rebuild if baseApiUrl changes
  dio.options = BaseOptions(
    baseUrl: ref.watch(configProvider).baseApiUrl,
    headers: headers,
    connectTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  );

  if (kReleaseMode) {
    print("release mode no logs");
  } else {
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      // responseBody: false,
      // responseHeader: true,
      // responseBody: true,
      compact: true,
      error: true,
    ));
  }

  return dio;
}
