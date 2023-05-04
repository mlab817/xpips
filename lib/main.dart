import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_size/window_size.dart';

import './application/providers/sharedpreferences.dart';
import 'application/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set window size for desktop
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('PIPS');
    setWindowMinSize(const Size(320, 600));
    setWindowMaxSize(Size.infinite);
  }

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      // override the previous value with the new object
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
    ],
    child: MyApp(),
  ));
}
