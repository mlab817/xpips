import 'package:flex_color_scheme/flex_color_scheme.dart';
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
        fontFamily: GoogleFonts.roboto().fontFamily!,
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
