import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String newValueText = newValue.text.replaceAll(',', '');
    int selectionIndex = newValue.selection.end;

    final formatter = NumberFormat('#,##0', 'en_US');
    String formattedValue = formatter.format(int.parse(newValueText));

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: selectionIndex + formattedValue.length - newValueText.length,
      ),
    );
  }
}
