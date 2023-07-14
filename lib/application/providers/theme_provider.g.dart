// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$darkThemeHash() => r'0d7478e5c1a75b340d32cc60cf75a5be6471329e';

/// See also [darkTheme].
@ProviderFor(darkTheme)
final darkThemeProvider = Provider<ThemeData>.internal(
  darkTheme,
  name: r'darkThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$darkThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DarkThemeRef = ProviderRef<ThemeData>;
String _$lightThemeHash() => r'e528977505af66b6709f5aca85d0fa4320021813';

/// See also [lightTheme].
@ProviderFor(lightTheme)
final lightThemeProvider = Provider<ThemeData>.internal(
  lightTheme,
  name: r'lightThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lightThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LightThemeRef = ProviderRef<ThemeData>;
String _$themeHash() => r'ef225d62015430a09e9fdfab9d61395c90048edf';

/// See also [Theme].
@ProviderFor(Theme)
final themeProvider = NotifierProvider<Theme, AppTheme>.internal(
  Theme.new,
  name: r'themeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Theme = Notifier<AppTheme>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
