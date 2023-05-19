import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final numberFormatterProvider = Provider<NumberFormat>((ref) {
  print('number formatter provider');

  return NumberFormat('#,##0.00', 'en_US');
});
