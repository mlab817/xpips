import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'numberformatter_provider.g.dart';

// @Riverpod(keepAlive: true)
// NumberFormat numberFormatter(NumberFormatterRef ref) =>
//     NumberFormat('#,##0', 'en_US');

final numberFormatterProvider =
    Provider<NumberFormat>((ref) => NumberFormat('#,##0', 'en_US'));
