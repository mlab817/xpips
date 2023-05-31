import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'numberformatter_provider.g.dart';

@riverpod
NumberFormat numberFormatter(NumberFormatterRef ref) =>
    NumberFormat('#,##0.00', 'en_US');
