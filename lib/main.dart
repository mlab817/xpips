import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pips/domain/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_size/window_size.dart';

import './application/app.dart';
import './application/providers/sharedpreferences.dart';

void main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();

  var path = Directory.current.path;

  // initialize hive and register adapters
  Hive
    ..init(path)
    ..registerAdapter(FormOptionsAdapter())
    ..registerAdapter(OptionAdapter())
    ..registerAdapter(OfficeAdapter());

  // set window size for desktop
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    setWindowTitle('Public Investment Program System');
    setWindowMinSize(const Size(320, 600));
    setWindowMaxSize(Size.infinite);
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);

  HttpOverrides.global = MyHttpOverrides();

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      // override the previous value with the new object
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
    ],
    child: const MyApp(),
  ));
}

// for Android
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
