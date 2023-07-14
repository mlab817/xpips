import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pips/data/repositories/repositories.dart';
import 'package:pips/data/requests/fcm_request.dart';
import 'package:pips/presentation/controllers/pushnotifications_controller.dart';
import 'package:pips/presentation/controllers/theme_controller.dart';
import 'package:universal_io/io.dart';

import '../../../../application/providers/theme_provider.dart';

class PreferencesScreen extends ConsumerStatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends ConsumerState<PreferencesScreen> {
  String? _fcmToken;

  Future<void> _getFcmToken() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      // ref
      //     .read(pushNotificationsControllerProvider.notifier)
      //     .toggle();

      print("fcmToken: $fcmToken");

      setState(() {
        _fcmToken = fcmToken;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, _getFcmToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isAndroid
          ? AppBar(
              title: const Text('Preferences'),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListView(
            shrinkWrap: true,
            children: [
              SwitchListTile(
                title: const Text('Push Notifications'),
                subtitle: const Text(
                    'Receive push notifications even when you are not using the app. Android only'),
                value: ref.watch(pushNotificationsControllerProvider),
                onChanged: _fcmToken != null
                    ? (bool value) async {
                        final authRepository =
                            ref.watch(authRepositoryProvider);

                        await authRepository
                            .updateFcmToken(FcmRequest(fcmToken: _fcmToken!));
                      }
                    : null,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('THEME'),
              ),
              SwitchListTile(
                title: const Text('Theme Mode'),
                subtitle:
                    Text(ref.watch(themeControllerProvider).name.toUpperCase()),
                value: ref.watch(themeControllerProvider) == ThemeMode.dark,
                onChanged: (bool value) {
                  ref.read(themeControllerProvider.notifier).switchTheme();
                },
              ),
              ListTile(
                title: const Text('Font Family'),
                subtitle: Text(ref.watch(themeProvider).fontFamily),
                trailing: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
                onTap: () {
                  //
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectFontFamily()));
                },
              ),
              ListTile(
                title: const Text('Color Scheme'),
                subtitle: Text(ref.watch(themeProvider).scheme.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectFlexScheme()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectFontFamily extends ConsumerWidget {
  const SelectFontFamily({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const testText =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Font Family'),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            value: GoogleFonts.roboto().fontFamily!,
            groupValue: ref.watch(themeProvider).fontFamily,
            title: Text(
              GoogleFonts.roboto().fontFamily!,
            ),
            subtitle: Text(
              testText,
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily!,
              ),
            ),
            onChanged: (String? value) {
              ref.read(themeProvider.notifier).update(fontFamily: value);
            },
          ),
          RadioListTile<String>(
            value: GoogleFonts.robotoCondensed().fontFamily!,
            groupValue: ref.watch(themeProvider).fontFamily,
            title: Text(
              GoogleFonts.robotoCondensed().fontFamily!,
            ),
            subtitle: Text(
              testText,
              style: TextStyle(
                fontFamily: GoogleFonts.robotoCondensed().fontFamily!,
              ),
            ),
            onChanged: (String? value) {
              //
              ref.read(themeProvider.notifier).update(fontFamily: value);
            },
          ),
          RadioListTile<String>(
            value: GoogleFonts.montserrat().fontFamily!,
            groupValue: ref.watch(themeProvider).fontFamily,
            title: Text(
              GoogleFonts.montserrat().fontFamily!,
            ),
            subtitle: Text(
              testText,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily!,
              ),
            ),
            onChanged: (String? value) {
              //
              ref.read(themeProvider.notifier).update(fontFamily: value);
            },
          ),
          RadioListTile<String>(
            value: GoogleFonts.raleway().fontFamily!,
            groupValue: ref.watch(themeProvider).fontFamily,
            title: Text(
              GoogleFonts.raleway().fontFamily!,
            ),
            subtitle: Text(
              testText,
              style: TextStyle(
                fontFamily: GoogleFonts.raleway().fontFamily!,
              ),
            ),
            onChanged: (String? value) {
              //
              ref.read(themeProvider.notifier).update(fontFamily: value);
            },
          ),
          RadioListTile<String>(
            value: GoogleFonts.quicksand().fontFamily!,
            groupValue: ref.watch(themeProvider).fontFamily,
            title: Text(
              GoogleFonts.quicksand().fontFamily!,
            ),
            subtitle: Text(
              testText,
              style: TextStyle(
                fontFamily: GoogleFonts.quicksand().fontFamily!,
              ),
            ),
            onChanged: (String? value) {
              //
              ref.read(themeProvider.notifier).update(fontFamily: value);
            },
          ),
          RadioListTile<String>(
            value: GoogleFonts.bebasNeue().fontFamily!,
            groupValue: ref.watch(themeProvider).fontFamily,
            title: Text(
              GoogleFonts.bebasNeue().fontFamily!,
            ),
            subtitle: Text(
              testText,
              style: TextStyle(
                fontFamily: GoogleFonts.bebasNeue().fontFamily!,
              ),
            ),
            onChanged: (String? value) {
              //
              ref.read(themeProvider.notifier).update(fontFamily: value);
            },
          ),
          RadioListTile<String>(
            value: GoogleFonts.mavenPro().fontFamily!,
            groupValue: ref.watch(themeProvider).fontFamily,
            title: Text(
              GoogleFonts.mavenPro().fontFamily!,
            ),
            subtitle: Text(
              testText,
              style: TextStyle(
                fontFamily: GoogleFonts.mavenPro().fontFamily!,
              ),
            ),
            onChanged: (String? value) {
              //
              ref.read(themeProvider.notifier).update(fontFamily: value);
            },
          ),
        ],
      ),
    );
  }
}

class SelectFlexScheme extends ConsumerStatefulWidget {
  const SelectFlexScheme({super.key});

  @override
  ConsumerState<SelectFlexScheme> createState() => _SelectFlexSchemeState();
}

class _SelectFlexSchemeState extends ConsumerState<SelectFlexScheme> {
  FlexScheme? _currentFlexScheme;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _currentFlexScheme = ref.watch(themeProvider).scheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ref.watch(themeControllerProvider),
      // dark theme
      darkTheme: FlexThemeData.dark(
        scheme: _currentFlexScheme,
        subThemesData: const FlexSubThemesData(
          interactionEffects: false,
          tintedDisabledControls: false,
          useTextTheme: true,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedBorderIsColored: false,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
          navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationRailIndicatorOpacity: 1.00,
          navigationRailBackgroundSchemeColor: SchemeColor.surface,
          navigationRailLabelType: NavigationRailLabelType.none,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: ref.watch(themeProvider).fontFamily,
      ),
      // light theme
      theme: FlexThemeData.light(
        scheme: _currentFlexScheme,
        lightIsWhite: true,
        subThemesData: const FlexSubThemesData(
          interactionEffects: false,
          tintedDisabledControls: false,
          useTextTheme: true,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedBorderIsColored: false,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
          navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationRailIndicatorOpacity: 1.00,
          navigationRailBackgroundSchemeColor: SchemeColor.surface,
          navigationRailLabelType: NavigationRailLabelType.none,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: ref.watch(themeProvider).fontFamily,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Select Flex Scheme'),
          actions: [
            FilledButton(
                onPressed: () {
                  ref
                      .read(themeProvider.notifier)
                      .update(scheme: _currentFlexScheme);

                  Navigator.pop(context);
                },
                child: const Text('APPLY')),
          ],
        ),
        body: Column(children: [
          RadioListTile<FlexScheme>(
            value: FlexScheme.greenM3,
            groupValue: _currentFlexScheme,
            title: Text(
              FlexScheme.greenM3.toString(),
            ),
            onChanged: (FlexScheme? value) {
              // ref.read(themeProvider.notifier).update(scheme: value);
              setState(() {
                _currentFlexScheme = value;
              });
            },
          ),
          RadioListTile<FlexScheme>(
            value: FlexScheme.amber,
            groupValue: _currentFlexScheme,
            title: Text(
              FlexScheme.amber.toString(),
            ),
            onChanged: (FlexScheme? value) {
              // ref.read(themeProvider.notifier).update(scheme: value);
              setState(() {
                _currentFlexScheme = value;
              });
            },
          ),
          RadioListTile<FlexScheme>(
            value: FlexScheme.blueM3,
            groupValue: _currentFlexScheme,
            title: Text(
              FlexScheme.blueM3.toString(),
            ),
            onChanged: (FlexScheme? value) {
              // ref.read(themeProvider.notifier).update(scheme: value);
              setState(() {
                _currentFlexScheme = value;
              });
            },
          ),
          RadioListTile<FlexScheme>(
            value: FlexScheme.yellowM3,
            groupValue: _currentFlexScheme,
            title: Text(
              FlexScheme.yellowM3.toString(),
            ),
            onChanged: (FlexScheme? value) {
              // ref.read(themeProvider.notifier).update(scheme: value);
              setState(() {
                _currentFlexScheme = value;
              });
            },
          ),
          RadioListTile<FlexScheme>(
            value: FlexScheme.redM3,
            groupValue: _currentFlexScheme,
            title: Text(
              FlexScheme.redM3.toString(),
            ),
            onChanged: (FlexScheme? value) {
              // ref.read(themeProvider.notifier).update(scheme: value);
              setState(() {
                _currentFlexScheme = value;
              });
            },
          ),
          RadioListTile<FlexScheme>(
            value: FlexScheme.material,
            groupValue: _currentFlexScheme,
            title: Text(
              FlexScheme.material.toString(),
            ),
            onChanged: (FlexScheme? value) {
              // ref.read(themeProvider.notifier).update(scheme: value);
              setState(() {
                _currentFlexScheme = value;
              });
            },
          ),
        ]),
      ),
    );
  }
}
