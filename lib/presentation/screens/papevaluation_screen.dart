import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/numberformatter_provider.dart';
import 'package:pips/domain/models/models.dart';
import 'package:pips/presentation/controllers/controllers.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';

@RoutePage()
class PapEvaluationScreen extends ConsumerStatefulWidget {
  const PapEvaluationScreen({
    super.key,
    required this.project,
  });

  final FullProject project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PapEvaluationScreenState();
}

class _PapEvaluationScreenState extends ConsumerState<PapEvaluationScreen> {
  bool? _recommendApproval = false;

  @override
  Widget build(BuildContext context) {
    final evaluationReportAsync =
        ref.watch(futureEvaluationProvider(uuid: widget.project.uuid));

    // final evaluationReport = EvaluationReport.initial();

    // final evaluationReport =
    //  ref.watch(evaluationReportControllerProvider(widget.project.uuid));

    return Scaffold(
      appBar: AppBar(
        title: const Text('PAP Evaluation Report'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
                onPressed: () {
                  //
                },
                child: const Text('PRINT')),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilledButton(
                onPressed: () {
                  //
                },
                child: const Text('SAVE')),
          ),
        ],
      ),
      body: evaluationReportAsync.when(
        data: (data) {
          if (evaluationReportAsync.isRefreshing) {
            return const LoadingOverlay();
          }

          return _buildShow();
        },
        error: (error, _) {
          return Text(error.toString());
        },
        loading: () => const LoadingOverlay(),
      ),
    );
  }

  Widget _buildShow() {
    final evaluationReport =
        ref.watch(evaluationReportControllerProvider(widget.project.uuid));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('I. PAP TITLE'),
              subtitle: Text(evaluationReport.title ?? 'NO TITLE'),
            ),
            const Divider(),
            // PAP title
            // proposed funding source / institution
            ListTile(
              title: const Text('II. FUNDING SOURCE / FUNDING INSTITUTIONS'),
              subtitle: Text(
                  '${evaluationReport.fundingSources} / ${widget.project.fundingInstitutions.map((e) => e.label).join(', ')}'),
            ),
            const Divider(),
            ListTile(
              title: const Text('III. OFFICE / IMPLEMENTING UNITS'),
              subtitle: Text(evaluationReport.implementingUnits ?? 'N/A'),
            ),
            const Divider(),
            // implementing units

            // background
            ListTile(
              title: const Text('IV. BACKGROUND'),
              subtitle: TextFormField(
                initialValue: evaluationReport.background,
                minLines: 5,
                maxLines: 5,
                onChanged: (String value) {
                  ref
                      .read(evaluationReportControllerProvider(
                              widget.project.uuid)
                          .notifier)
                      .update(background: value);
                },
              ),
            ),
            const Divider(),
            // rationale
            ListTile(
              title: const Text('V. RATIONALE'),
              subtitle: TextFormField(
                initialValue: evaluationReport.rationale,
                minLines: 5,
                maxLines: 5,
                onChanged: (String value) {
                  ref
                      .read(evaluationReportControllerProvider(
                              widget.project.uuid)
                          .notifier)
                      .update(rationale: value);
                },
              ),
            ),

            const Divider(),
            // description
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('VI. DESCRIPTION'),
            ),
            // 1. objectives
            ListTile(
              title: const Text('VI.1. OBJECTIVES'),
              subtitle: TextFormField(
                initialValue: evaluationReport.objectives,
                minLines: 5,
                maxLines: 5,
                onChanged: (String value) {
                  ref
                      .read(evaluationReportControllerProvider(
                              widget.project.uuid)
                          .notifier)
                      .update(objectives: value);
                },
              ),
            ),
            // 2. beneficiaries
            ListTile(
              title: const Text('VI.2. BENEFICIARIES'),
              subtitle: TextFormField(
                initialValue: evaluationReport.beneficiaries,
                minLines: 5,
                maxLines: 5,
                onChanged: (String value) {
                  ref
                      .read(evaluationReportControllerProvider(
                              widget.project.uuid)
                          .notifier)
                      .update(beneficiaries: value);
                },
              ),
            ),
            // 3. spatial coverage
            ListTile(
              title: const Text('VI.3. SPATIAL COVERAGE'),
              subtitle: Text(widget.project.spatialCoverage?.label ??
                  'NO SPATIAL COVERAGE'),
            ),
            // 4. components
            const ListTile(
              title: Text('VI.4. COMPONENTS'),
              subtitle: TextField(
                minLines: 5,
                maxLines: 5,
              ),
            ),
            // 5. budget estimate
            ListTile(
              title: const Text('VI.5. BUDGET ESTIMATE'),
              subtitle: Text(
                'PHP ${ref.watch(numberFormatterProvider).format(widget.project.totalCost)}',
              ),
            ),
            // 6. implementation period
            ListTile(
              title: const Text('VI.6. IMPLEMENTATION PERIOD'),
              subtitle: Text(evaluationReport.implementationPeriod ?? 'N/A'),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('VII. EVALUATION'),
            ),
            // evaluation
            // 1. responsiveness
            const ListTile(
              title: Text('VII.1. RESPONSIVENESS'),
            ),
            ListTile(
              title: const Text('VII.1.i. SUSTAINABLE DEVELOPMENT GOALS'),
              subtitle:
                  Text(widget.project.sdgs.map((e) => e.label).join(', ')),
            ),
            ListTile(
              title: const Text('VII.1.ii. SOCIOECONOMIC AGENDA'),
              subtitle:
                  Text(widget.project.agenda.map((e) => e.label).join(', ')),
            ),
            ListTile(
              title: const Text('VII.1.iii. PHILIPPINE DEVELOPMENT PLAN'),
              subtitle: Text(
                  '${widget.project.pdpChapter?.label} / ${widget.project.pdpChapters.map((e) => e.label).join(', ')}'),
            ),
            const ListTile(
              title: Text(
                  'VII.1.iv. NATIONAL AGRICULTURE AND FISHERIES MODERNIZATION AND INDUSTRIALIZATION PLAN'),
              subtitle: TextField(
                minLines: 5,
                maxLines: 5,
              ),
            ),
            const ListTile(
              title: Text(
                  'VII.1.v. ANNUAL PLAN AND BUDGET PREPARATION GUIDELINES'),
              subtitle: TextField(
                minLines: 5,
                maxLines: 5,
              ),
            ),
            // 2. readiness
            ListTile(
              title: const Text('VII.2. READINESS'),
              subtitle: TextFormField(
                initialValue: evaluationReport.readiness,
                minLines: 5,
                maxLines: 5,
                onChanged: (String value) {
                  ref
                      .read(evaluationReportControllerProvider(
                              widget.project.uuid)
                          .notifier)
                      .update(readiness: value);
                },
              ),
            ),
            // 3. typology
            ListTile(
              title: const Text('VII.3. TYPOLOGY'),
              subtitle: Text(evaluationReport.typology ?? 'N/A'),
            ),
            // 4. other comments
            ListTile(
              title: const Text('VII.4. OTHER COMMENTS'),
              subtitle: TextFormField(
                initialValue: evaluationReport.otherComments,
                minLines: 5,
                maxLines: 5,
                onChanged: (String value) {
                  ref
                      .read(evaluationReportControllerProvider(
                              widget.project.uuid)
                          .notifier)
                      .update(otherComments: value);
                },
              ),
            ),
            const Divider(),
            // recommendation
            // 1. endorse or not
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('VIII. RECOMMENDATIONS'),
            ),
            InkWell(
              child: Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: _recommendApproval,
                    onChanged: (bool? value) {
                      setState(() {
                        _recommendApproval = value;
                      });
                    },
                  ),
                  const Text('Recommended for Approval'),
                ],
              ),
              onTap: () {
                setState(() {
                  _recommendApproval = true;
                });
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Radio(
                    value: false,
                    groupValue: _recommendApproval,
                    onChanged: (bool? value) {
                      setState(() {
                        _recommendApproval = value;
                      });
                    },
                  ),
                  const Text('NOT Recommended for Approval'),
                ],
              ),
              onTap: () {
                setState(() {
                  _recommendApproval = false;
                });
              },
            ),
            // 2. any other recommendations on the PAP - support item 1
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Recommendations',
                ),
                minLines: 5,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
