// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$darkThemeHash() => r'13263e6ad5903722ea3fda706b2814721ad7b75a';

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
String _$lightThemeHash() => r'592821fcfc45e2f0bedd1834b8960f410bc5a655';

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
String _$themeHash() => r'5a500a5426502e33df40a6909d25162fd973be5a';

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
