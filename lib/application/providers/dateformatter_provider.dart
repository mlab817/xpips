import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// Provide a consistent way to format dates in the app with yMMMd
/// returns [DateFormat]
/// Use as dateFormatterProvider.format(date)
final dateFormatterProvider = Provider<DateFormat>((ref) {
  return DateFormat.yMMMd();
});
