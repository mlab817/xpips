import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

class AppTheme {
  FlexScheme scheme;

  String fontFamily;

  AppTheme({
    required this.scheme,
    required this.fontFamily,
  });

  AppTheme copyWith({
    FlexScheme? scheme,
    String? fontFamily,
  }) {
    return AppTheme(
      scheme: scheme ?? this.scheme,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  AppTheme build() => AppTheme(
        scheme: FlexScheme.greenM3,
        fontFamily: GoogleFonts.sairaExtraCondensed().fontFamily!,
      );

  void update({
    FlexScheme? scheme,
    String? fontFamily,
  }) {
    state = state.copyWith(
      scheme: scheme ?? state.scheme,
      fontFamily: fontFamily ?? state.fontFamily,
    );
  }
}

@Riverpod(keepAlive: true)
ThemeData darkTheme(DarkThemeRef ref) {
  return FlexThemeData.dark(
    scheme: ref.watch(themeProvider).scheme,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.bebasNeue().copyWith(
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
      ),
      headlineLarge: TextStyle(
        fontSize: 12,
      ),
      headlineMedium: TextStyle(
        fontSize: 10,
      ),
      headlineSmall: TextStyle(
        fontSize: 9,
      ),
      bodyLarge: TextStyle(
        fontSize: 11,
      ),
      bodyMedium: TextStyle(
        fontSize: 9,
      ),
      bodySmall: TextStyle(
        fontSize: 8,
      ),
      labelLarge: TextStyle(
        fontSize: 11,
      ),
      labelMedium: TextStyle(
        fontSize: 9,
      ),
      labelSmall: TextStyle(
        fontSize: 8,
      ),
    ),
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
  );
}

@Riverpod(keepAlive: true)
ThemeData lightTheme(LightThemeRef ref) {
  return FlexThemeData.light(
    scheme: ref.watch(themeProvider).scheme,
    lightIsWhite: true,
    appBarStyle: FlexAppBarStyle.material,
    // textTheme: TextTheme(
    //   // used in AppBar title
    //   titleLarge: GoogleFonts.bebasNeue().copyWith(
    //     fontSize: 18,
    //   ),
    //   // input text, dropdown, controls
    //   titleMedium: GoogleFonts.bebasNeue().copyWith(
    //     fontSize: 14,
    //   ),
    //   titleSmall: GoogleFonts.roboto().copyWith(
    //     fontSize: 14,
    //   ),
    //   headlineLarge: GoogleFonts.roboto().copyWith(
    //     fontSize: 12,
    //   ),
    //   headlineMedium: GoogleFonts.roboto().copyWith(
    //     fontSize: 10,
    //   ),
    //   headlineSmall: GoogleFonts.roboto().copyWith(
    //     fontSize: 9,
    //   ),
    //   bodyLarge: GoogleFonts.roboto().copyWith(
    //     fontSize: 14,
    //   ),
    //   bodyMedium: GoogleFonts.roboto().copyWith(
    //     fontSize: 12,
    //   ),
    //   bodySmall: GoogleFonts.roboto().copyWith(
    //     fontSize: 10,
    //   ),
    //   // button, chip
    //   labelLarge: GoogleFonts.bebasNeue().copyWith(
    //     fontSize: 13,
    //   ),
    //   labelMedium: GoogleFonts.roboto().copyWith(
    //     fontSize: 13,
    //   ),
    //   // list tile trailing
    //   labelSmall: GoogleFonts.bebasNeue().copyWith(
    //     fontSize: 12,
    //   ),
    // ),
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
    useMaterial3ErrorColors: true,
  );
}
