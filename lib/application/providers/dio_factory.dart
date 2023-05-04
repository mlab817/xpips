import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/config.dart';
import '../../application/providers/sharedpreferences.dart';

class DioFactory {
  final SharedPreferences sharedPreferences;

  DioFactory(this.sharedPreferences);

  Dio getDio() {
    Dio dio = Dio();

    // retrieve token from shared_prefs
    String? token = sharedPreferences.getString('BEARER_TOKEN');

    debugPrint("go called and token is $token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
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
}

// create factory provider by injecting shared prefs
final dioFactoryProvider = Provider<DioFactory>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return DioFactory(sharedPreferences);
});

// create dio provider to access the instance created by DioFactory
final dioProvider = Provider<Dio>((ref) {
  final dioFactory = ref.watch(dioFactoryProvider);

  return dioFactory.getDio();
});
