import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpips/screens/chat_screen.dart';
import 'package:xpips/screens/forgotpassword_screen.dart';
import 'package:xpips/screens/home_screen.dart';
import 'package:xpips/screens/login_screen.dart';
import 'package:xpips/screens/notifications_screen.dart';
import 'package:xpips/screens/settings_screen.dart';
import 'package:xpips/screens/signup_screen.dart';
import 'package:xpips/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIPS',
      // debugShowMaterialGrid: true,
      // showPerformanceOverlay: true,
      theme: ThemeData(
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
        primaryColor: Colors.pink[900],
        primarySwatch: Colors.pink,
        appBarTheme: const AppBarTheme(elevation: 0),
        inputDecorationTheme: const InputDecorationTheme(
            // TODO: customize input decoration theme
            ),
      ),
      home: const HomeScreen(),
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
