import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dateformatter_provider.g.dart';

/// Provide a consistent way to format dates in the app with yMMMd
/// returns [DateFormat]
/// Use as dateFormatterProvider.format(date)
@Riverpod(keepAlive: true)
DateFormat dateFormatter(DateFormatterRef ref) {
  return DateFormat.yMMMd();
}
