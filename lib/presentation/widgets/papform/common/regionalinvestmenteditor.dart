import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/extensions.dart';

import '../../../../presentation/widgets/papform/common/numericeditor.dart';
import '../../../../presentation/widgets/responsive_container.dart';
import '../../../../domain/entities/models.dart';
import '../../../../presentation/controllers/controllers.dart';
import '../../../../application/providers/numberformatter_provider.dart';

class RegionalInvestmentEditor extends ConsumerStatefulWidget {
  const RegionalInvestmentEditor({
    super.key,
    required this.project,
    required this.oldValue,
    required this.options,
    required this.onSubmit,
  });

  final FullProject project;
  final RegionalInvestment oldValue;
  final List<Option> options;
  final Function(RegionalInvestment newValue) onSubmit;

  @override
  ConsumerState<RegionalInvestmentEditor> createState() =>
      _RegionalInvestmentEditorState();
}

class _RegionalInvestmentEditorState
    extends ConsumerState<RegionalInvestmentEditor> {
  late RegionalInvestment oldValue;
  late RegionalInvestment newValue;

  final TextEditingController y0 = TextEditingController();
  final TextEditingController y1 = TextEditingController();
  final TextEditingController y2 = TextEditingController();
  final TextEditingController y3 = TextEditingController();
  final TextEditingController y4 = TextEditingController();
  final TextEditingController y5 = TextEditingController();
  final TextEditingController y6 = TextEditingController();
  final TextEditingController y7 = TextEditingController();

  @override
  void initState() {
    super.initState();

    oldValue = widget.oldValue;
    newValue = oldValue;

    y0.text = newValue.y2022.toString();
    y0.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2022: double.tryParse(y0.text.replaceAll(',', '')));
      });
    });
    y1.text = newValue.y2023.toString();
    y1.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2023: double.tryParse(y1.text.replaceAll(',', '')));
      });
    });
    y2.text = newValue.y2024.toString();
    y2.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2024: double.tryParse(y2.text.replaceAll(',', '')));
      });
    });
    y3.text = newValue.y2025.toString();
    y3.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2025: double.tryParse(y3.text.replaceAll(',', '')));
      });
    });
    y4.text = newValue.y2026.toString();
    y5.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2026: double.tryParse(y4.text.replaceAll(',', '')));
      });
    });
    y5.text = newValue.y2027.toString();
    y5.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2027: double.tryParse(y5.text.replaceAll(',', '')));
      });
    });
    y6.text = newValue.y2028.toString();
    y6.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2028: double.tryParse(y6.text.replaceAll(',', '')));
      });
    });
    y7.text = newValue.y2029.toString();
    y7.addListener(() {
      setState(() {
        newValue = newValue.copyWith(
            y2029: double.tryParse(y7.text.replaceAll(',', '')));
      });
    });
  }

  @override
  void dispose() {
    y0.dispose();
    y1.dispose();
    y2.dispose();
    y3.dispose();
    y4.dispose();
    y5.dispose();
    y6.dispose();
    y7.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final curSelectedRegions = ref
        .watch(fullProjectControllerProvider(widget.project.uuid))
        .regionalInvestments
        .map((e) => e.region);

    final filteredOptions = widget.options.where((element) {
      // exclude if already selected before or is the current element
      return !curSelectedRegions.contains(element) ||
          element == widget.oldValue.region;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Cost by Region'),
        actions: [
          FilledButton(
              onPressed: oldValue == newValue
                  ? null
                  : () {
                      widget.onSubmit(newValue);
                    },
              child: const Text('UPDATE')),
        ],
      ),
      body: ResponsiveContainer(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownMenu<Option>(
              // disable if it is not null to prevent modification
              enabled: widget.oldValue.region == null,
              width: width <= 1080 ? width - 16 : width / 10 - 16,
              label: const Text('Region'),
              initialSelection: oldValue.region,
              dropdownMenuEntries: widget.options
                  .map((e) => DropdownMenuEntry(
                        value: e,
                        label: e.label,
                        enabled: filteredOptions.contains(e),
                      ))
                  .toList(),
              onSelected: (Option? value) {
                //
                setState(() {
                  newValue = newValue.copyWith(
                    region: value,
                    regionId: value?.value,
                  );
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y0,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'FY 2022 & PRIOR'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y1,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter()
              ],
              decoration: const InputDecoration(labelText: 'FY 2023'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y2,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'FY 2024'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y3,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'FY 2025'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y4,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'FY 2026'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y5,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'FY 2027'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y6,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'FY 2028'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: y7,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericTextFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'FY 2029 & BEYOND'),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(5.0), bottom: Radius.circular(5.0)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ref.watch(numberFormatterProvider).format(
                            newValue.total,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
