import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../application/providers/inputdecoration_provider.dart';
import '../../../application/providers/numberformatter_provider.dart';

class CostField extends ConsumerWidget {
  const CostField(
      {Key? key,
      required this.onChanged,
      this.enabled,
      this.value,
      this.focusNode})
      : super(key: key);

  final Function(String value) onChanged;
  final bool? enabled;
  final String? value;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      // controller: controller,
      initialValue: value != null
          ? ref.watch(numberFormatterProvider).format(num.tryParse(value!))
          : '',
      decoration: ref.watch(inputDecorationProvider),
      textAlign: TextAlign.right,
      textAlignVertical: TextAlignVertical.center,
      expands: false,
      enabled: enabled ?? true,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      focusNode: focusNode,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ThousandsSeparatorInputFormatter(),
      ],
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      // Split the string into its integer and decimal parts
      String valueToFormat = newValueText.replaceAll(',', '');

      return TextEditingValue(
        text: NumberFormat('#,###.0#').format(valueToFormat),
        selection: TextSelection.collapsed(
          offset: valueToFormat.length,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
