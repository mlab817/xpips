import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpips/application/providers/sharedpreferences.dart';
import 'package:xpips/presentation/controllers/auth_controller.dart';
import 'package:xpips/screens/chat_screen.dart';
import 'package:xpips/screens/forgotpassword_screen.dart';
import 'package:xpips/screens/home_screen.dart';
import 'package:xpips/screens/login_screen.dart';
import 'package:xpips/screens/notifications_screen.dart';
import 'package:xpips/screens/settings_screen.dart';
import 'package:xpips/screens/signup_screen.dart';
import 'package:xpips/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      // override the previous value with the new object
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    debugPrint(currentUser.toString());

    return MaterialApp(
      title: 'PIPS',
      // debugShowMaterialGrid: true,
      // showPerformanceOverlay: true,
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
        primaryColor: Colors.green[900],
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(elevation: 0),
        inputDecorationTheme: const InputDecorationTheme(
            // TODO: customize input decoration theme
            ),
      ),
      home: currentUser != null ? const HomeScreen() : const LoginScreen(),
      // TODO: replace with auto route
      routes: {
        '/splash': (context) => const SplashScreen(),
        // authentication screens
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/signup': (context) => const SignupScreen(),
        // contents
        '/chat': (context) => const ChatScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      initialRoute: '/settings',
    );
  }
}
