import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../application/config.dart';
import 'bearertoken_provider.dart';

class DioFactory extends Notifier<Dio> {
  Dio getDio() {
    Dio dio = Dio();

    // retrieve token from shared_prefs
    // String? token = sharedPreferences.getString('BEARER_TOKEN');

    // debugPrint("getDio called and token is $token");
    final token = ref.watch(bearerTokenNotifierProvider);

    print("token $token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token.toString()}',
    };

    dio.options = BaseOptions(
      baseUrl: Config.baseUrl,
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

  @override
  build() {
    return getDio();
  }
}

// create factory provider by injecting shared prefs
final dioFactoryProvider = NotifierProvider<DioFactory, Dio>(() {
  return DioFactory();
});

// create dio provider to access the instance created by DioFactory
final dioProvider = Provider<Dio>((ref) {
  final dioFactory = ref.watch(dioFactoryProvider);

  return dioFactory;
});
