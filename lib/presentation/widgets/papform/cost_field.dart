import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers/inputdecoration_provider.dart';
import '../../../application/providers/numberformatter_provider.dart';

class CostField extends ConsumerWidget {
  const CostField({Key? key, required this.onChanged, this.enabled, this.value})
      : super(key: key);

  final Function(String value) onChanged;
  final bool? enabled;
  final String? value;

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
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        NumericTextFormatter(ref),
      ],
    );
  }
}

class NumericTextFormatter extends TextInputFormatter {
  final WidgetRef ref;

  NumericTextFormatter(this.ref);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '0');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = ref.watch(numberFormatterProvider);
      final number =
          double.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
