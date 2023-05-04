import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime now = DateTime.now();

  var parsedDate = DateTime.parse(date);

  // date is within the 24 hrs
  if (parsedDate.year == now.year &&
      parsedDate.month == now.month &&
      parsedDate.day == now.day) {
    return DateFormat.jm().format(parsedDate);
  }

  return DateFormat.yMMMd().format(parsedDate);
}
