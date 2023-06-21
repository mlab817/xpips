import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/numberformatter_provider.dart';
import 'package:pips/presentation/widgets/papform/common/editbutton.dart';

import '../../../../domain/models/models.dart';

class ScheduleEditor extends ConsumerStatefulWidget {
  const ScheduleEditor({
    super.key,
    required this.project,
    required this.title,
    required this.oldValue,
    required this.onSubmit,
    this.enabled = true,
  });

  final FullProject project;
  final String title;
  final CostSchedule oldValue;
  final Function(CostSchedule newValue) onSubmit;
  final bool enabled;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScheduleEditorState();
}

class _ScheduleEditorState extends ConsumerState<ScheduleEditor> {
  void _edit() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CostScheduleForm(
              title: widget.title,
              oldValue: widget.oldValue,
              onSubmit: widget.onSubmit,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(widget.title),
        enabled: widget.enabled,
        trailing: widget.project.readonly
            ? null
            : EditButton(onPressed: () {
                _edit();
              }),
        subtitle: SizedBox(
          width: double.infinity,
          child: Table(
            border: TableBorder.all(
                color: Theme.of(context).primaryColor, width: 0.5),
            children: [
              const TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FY 2023',
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FY 2024',
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FY 2025',
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FY 2026',
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FY 2027',
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FY 2028',
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'TOTAL',
                    textAlign: TextAlign.end,
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(widget.oldValue.y2023),
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(widget.oldValue.y2024),
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(widget.oldValue.y2025),
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(widget.oldValue.y2026),
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(widget.oldValue.y2027),
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(widget.oldValue.y2028),
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(widget.oldValue.total),
                    textAlign: TextAlign.end,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class CostScheduleForm extends ConsumerStatefulWidget {
  const CostScheduleForm({
    super.key,
    required this.title,
    required this.oldValue,
    required this.onSubmit,
  });

  final String title;
  final CostSchedule oldValue;
  final Function(CostSchedule newValue) onSubmit;

  @override
  ConsumerState<CostScheduleForm> createState() => _CostScheduleFormState();
}

class _CostScheduleFormState extends ConsumerState<CostScheduleForm> {
  late CostSchedule oldValue;
  late CostSchedule newValue;

  final TextEditingController y1 = TextEditingController();
  final TextEditingController y2 = TextEditingController();
  final TextEditingController y3 = TextEditingController();
  final TextEditingController y4 = TextEditingController();
  final TextEditingController y5 = TextEditingController();
  final TextEditingController y6 = TextEditingController();

  @override
  void initState() {
    super.initState();

    oldValue = widget.oldValue;
    newValue = oldValue;

    y1.text = newValue.y2023.toString();
    y1.addListener(() {
      setState(() {
        newValue = newValue.copyWith(y2023: double.tryParse(y1.text));
      });
    });
    y2.text = newValue.y2024.toString();
    y2.addListener(() {
      setState(() {
        newValue = newValue.copyWith(y2024: double.tryParse(y2.text));
      });
    });
    y3.text = newValue.y2025.toString();
    y3.addListener(() {
      setState(() {
        newValue = newValue.copyWith(y2025: double.tryParse(y3.text));
      });
    });
    y4.text = newValue.y2026.toString();
    y5.addListener(() {
      setState(() {
        newValue = newValue.copyWith(y2026: double.tryParse(y4.text));
      });
    });
    y5.text = newValue.y2027.toString();
    y5.addListener(() {
      setState(() {
        newValue = newValue.copyWith(y2027: double.tryParse(y5.text));
      });
    });
    y6.text = newValue.y2028.toString();
    y6.addListener(() {
      setState(() {
        newValue = newValue.copyWith(y2028: double.tryParse(y6.text));
      });
    });
  }

  @override
  void dispose() {
    y1.dispose();
    y2.dispose();
    y3.dispose();
    y4.dispose();
    y5.dispose();
    y6.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: y1,
            decoration: const InputDecoration(labelText: 'FY 2023'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: y2,
            decoration: const InputDecoration(labelText: 'FY 2024'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: y3,
            decoration: const InputDecoration(labelText: 'FY 2025'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: y4,
            decoration: const InputDecoration(labelText: 'FY 2026'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: y5,
            decoration: const InputDecoration(labelText: 'FY 2027'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: y6,
            decoration: const InputDecoration(labelText: 'FY 2028'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        Padding(
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
              child: Text(
                ref.watch(numberFormatterProvider).format(
                      newValue.total,
                    ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
