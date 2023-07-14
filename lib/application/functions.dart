import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

String formatError(e) {
  print(' ----------- Error: -----------');
  print(e);

  if (e is DioException) {
    // Handle DioError specifically
    if (e.response != null) {
      // if validation error, return the error message
      if (e.response!.statusCode == 422) {
        return 'Error: ${e.response!.data['message']}!';
      }

      // unauthenticated
      if (e.response!.statusCode == 401) {
        return 'Error: You are not logged in!';
      }

      // not found
      if (e.response!.statusCode == 404) {
        return 'Error: Resource not found!';
      }

      // unauthorized exception
      if (e.response!.statusCode == 403) {
        return 'Error: You are not allowed to do that!';
      }

      // DioError with response (e.g., server returned an error status code)
      return 'Error: ${e.response!.statusCode} - ${e.response!.statusMessage}';
    } else {
      // DioError without response (e.g., network connectivity issue)
      return 'Error: ${e.message}';
    }
  } else {
    print("Error is $e");
    // Handle other types of errors
    return 'Unknown Error';
  }
}

/// Show a snackbar given [BuildContext] and [String] message
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
