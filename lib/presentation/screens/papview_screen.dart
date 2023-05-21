import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:pips/application/extensions.dart';
import 'package:pips/data/responses/project_response.dart';
import 'package:pips/domain/models/fullproject.dart';
import 'package:pips/presentation/controllers/viewpap_controller.dart';

import '../../application/providers/dateformatter_provider.dart';
import '../../application/providers/valueformatter_provider.dart';
import '../../data/repositories/newcomment_repository.dart';
import '../../data/requests/comment_request.dart';
import '../../domain/models/financial_accomplishment.dart';
import '../../domain/models/fs_investment.dart';
import '../../domain/models/regional_investment.dart';
import '../controllers/realtimecomments_controller.dart';

@RoutePage()
class PapViewScreen extends ConsumerStatefulWidget {
  const PapViewScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PapViewScreen> createState() => _PapViewScreenState();
}

class _PapViewScreenState extends ConsumerState<PapViewScreen> {
  bool _isExpanded = false;

  final TextEditingController _textEditingController = TextEditingController();

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final pusherClient = ref.watch(pusherClientProvider);
    //
    // final allChannels = <Channel>[
    //   pusherClient.publicChannel('PIPSv3.Public'),
    // ];
    //
    // pusherClient.onConnectionEstablished.listen((_) {
    //   for (final channel in allChannels) {
    //     channel.subscribeIfNotUnsubscribed();
    //   }
    // });
    //
    // final subscription = pusherClient
    //     .publicChannel('PIPSv3.Public')
    //     .bindToAll()
    //     .listen((event) {});
    //
    // subscription.onData((ChannelReadEvent event) {
    //   debugPrint(
    //     event.toString(),
    //   );
    // });

    final projectProfileAsync = ref.watch(viewPapControllerProvider);

    // ref.watch(realTimeCommentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref
              .watch(selectedProjectProvider)
              ?.title ?? 'No Project Selected',
          overflow: TextOverflow.ellipsis,
        ),
        // scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
          ),
        ],
      ),
      floatingActionButton: !_isExpanded
          ? FloatingActionButton(
        onPressed: () {
          // expand messenger like
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: const Icon(Icons.chat_bubble),
      )
          : null,
      body: Stack(
        children: [
          // content
          projectProfileAsync.when(
            data: (data) {
              if (data != null) {
                return _buildShow(data);
              }
              return const Center(
                child: Text('Something went wrong.'),
              );
            },
            error: (error, stacktrace) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
            loading: () =>
            const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          // chat box
          _buildChat(),
        ],
      ),
    );
  }

  Widget _buildShow(ProjectResponse response) {
    final FullProject project = response.project;

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        // General Information
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'General Information',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                subtitle: Text(project.title ?? 'N/A'),
                title: const Text('Title'),
              ),
              ListTile(
                subtitle: Text(project.type?.label ?? 'N/A'),
                title: const Text('Program or Project'),
              ),
              ListTile(
                subtitle: Text(project.regularProgram != null &&
                    project.regularProgram == true
                    ? 'Yes'
                    : 'No'),
                title: const Text('Regular Program'),
              ),
              ListTile(
                subtitle: Text(
                  project.bases.map((e) => e.label).join(', '),
                ),
                title: const Text('Basis for Implementation'),
              ),
              ListTile(
                subtitle: Text(project.description ?? 'N/A'),
                title: const Text('Description'),
              ),
              ListTile(
                subtitle: Text(ref
                    .watch(numberFormatterProvider)
                    .format(project.totalCost)),
                title: const Text('Total Project Cost'),
              ),
            ]),
          ),
        ),
        // Implementing Offices/Units
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Implementing Offices/Units',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                subtitle: Text(project.office?.name ?? 'N/A'),
                title: const Text('Office'),
              ),
              ListTile(
                subtitle: Text(
                  project.operatingUnits.map((e) => e.label).join(', '),
                ),
                title: const Text('Implementing Units'),
              ),
            ]),
          ),
        ),
        // Spatial Coverage
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Spatial Coverage',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                subtitle: Text(project.spatialCoverage?.label ?? 'N/A'),
                title: const Text('Spatial Coverage'),
              ),
              ListTile(
                subtitle: Text(
                  project.locations.map((e) => e.label).join(', '),
                ),
                title: const Text('Regions/Provinces'),
              ),
            ]),
          ),
        ),
        // Level of Approval
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Level of Approval',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                subtitle: Text(
                    project.iccable != null && project.iccable == true
                        ? 'Yes'
                        : 'No'),
                title: const Text('Requires ICC submission?'),
              ),
              ListTile(
                subtitle: Text(project.approvalLevel?.label ?? 'N/A'),
                title: const Text('Approval Level'),
              ),
              ListTile(
                subtitle: Text(project.approvalLevelDate != null
                    ? DateFormat.yMMMd().format(project.approvalLevelDate!)
                    : 'N/A'),
                title: const Text('As of'),
              ),
            ]),
          ),
        ),
        // Project for Inclusion in Which Programming Document
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Project for Inclusion in Which Programming Document',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                subtitle: Text(
                    project.pip != null && project.pip == true ? 'Yes' : 'No'),
                title: const Text('Public Investment Program (PIP)'),
              ),
              ListTile(
                subtitle: Text(project.typology?.label ?? 'N/A'),
                title: const Text('Typology of PIP'),
              ),
              ListTile(
                subtitle: Text(
                    project.cip != null && project.cip == true ? 'Yes' : 'No'),
                title: const Text('Core Investment Programs/Projects (CIP)'),
              ),
              ListTile(
                subtitle: Text(project.cipType?.label ?? 'N/A'),
                title: const Text('Type of CIP'),
              ),
              ListTile(
                subtitle: Text(project.trip != null && project.trip == true
                    ? 'Yes'
                    : 'No'),
                title: const Text(
                    'Three-year Rolling Infastracture Program(TRIP)'),
              ),
              ListTile(
                subtitle: Text(
                    project.research != null && project.research == true
                        ? 'Yes'
                        : 'No'),
                title: const Text(
                    'Is it a Research and Development Program/Project?'),
              ),
              ListTile(
                subtitle: Text(project.covid != null && project.covid == true
                    ? 'Yes'
                    : 'No'),
                title: const Text(
                    'Is it responsive to COVID-19/New Normal Intervention?'),
              ),
              ListTile(
                subtitle: Text(project.rdip != null && project.rdip == true
                    ? 'Yes'
                    : 'No'),
                title:
                const Text('Is the Program/Project included in the RDIP?'),
              ),
            ]),
          ),
        ),
        // PDP chapters
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Philippine Development Plan (PDP) Chapter',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  subtitle: Text(project.pdpChapter?.label ?? 'N/A'),
                  title:
                  const Text('Philippine Development Plan (PDP) Chapter'),
                ),
                ListTile(
                  subtitle: Text(
                    project.pdpChapters.map((e) => e.label).join(', '),
                  ),
                  title: const Text(
                      'Other Philippine Development Plan (PDP) Chapter/s'),
                ),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Physical Updates and Status',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text('Updates'),
                subtitle: Text(project.updates ?? 'N/A'),
              ),
              ListTile(
                title: const Text('As of'),
                subtitle: Text(project.asOf != null
                    ? DateFormat.yMMMd().format(project.asOf!)
                    : 'N/A'),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Main Infrastructure Sector/Subsector',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Main Infrastructure Sector/Subsector',
                ),
                subtitle: Text(
                  project.infrastructureSectors.map((e) => e.label).join(', '),
                ),
              ),
              ListTile(
                title: const Text(
                  'Prerequisites',
                ),
                subtitle: Text(
                  project.prerequisites.map((e) => e.label).join(', '),
                ),
              ),
              ListTile(
                title: const Text(
                  'Implementation Risks and Mitigation Strategies',
                ),
                subtitle: Text(
                  project.risk ?? 'N/A',
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Expected Outputs/Deliverables',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Indicator',
                ),
                subtitle: Text(
                  project.expectedOutputs ?? 'N/A',
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              '8-Point Socioeconomic Agenda',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  '8-Point Socioeconomic Agenda',
                ),
                subtitle: Text(
                  project.agenda.map((e) => e.label).join(', '),
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Sustainable Development Goals',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Sustainable Development Goals',
                ),
                subtitle: Text(
                  project.sdgs.map((e) => e.label).join(', '),
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Level of GAD Responsiveness',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Level of GAD Responsiveness',
                ),
                subtitle: Text(
                  project.gad?.label ?? 'N/A',
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Funding Source and Mode of Implementation',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Main Funding Source',
                ),
                subtitle: Text(
                  project.fundingSource?.label ?? 'N/A',
                ),
              ),
              ListTile(
                title: const Text(
                  'Funding Sources',
                ),
                subtitle: Text(
                  project.fundingSources.map((e) => e.label).join(', '),
                ),
              ),
              ListTile(
                title: const Text(
                  'Funding Institutions',
                ),
                subtitle: Text(
                  project.fundingInstitutions.map((e) => e.label).join(', '),
                ),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Physical and Financial Status',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text(
                  'Category',
                ),
                subtitle: Text(
                  project.category?.label ?? 'N/A',
                ),
              ),
              ListTile(
                title: const Text(
                  'Status of Implementation Readiness',
                ),
                subtitle: Text(
                  project.projectStatus?.label ?? 'N/A',
                ),
              ),
              ListTile(
                title: const Text(
                  'Will require resubmission to the ICC?',
                ),
                subtitle: Text(
                  project.iccable != null && project.iccable == true
                      ? 'Yes'
                      : 'No',
                ),
              ),
              ListTile(
                title: const Text('Updates'),
                subtitle: Text(project.updates ?? 'N/A'),
              ),
              ListTile(
                title: const Text('As of'),
                subtitle: Text(project.asOf != null
                    ? DateFormat.yMMMd().format(project.asOf!)
                    : 'N/A'),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Implementation Period',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text('Start of Project Implementation'),
                subtitle: Text(project.startYear?.label ?? 'N/A'),
              ),
              ListTile(
                title: const Text('Year of Project Completion'),
                subtitle: Text(project.endYear?.label ?? 'N/A'),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Investment Cost per Region',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildRegionalTable(project),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Investment Cost per Funding Source',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildFinancialTable(project),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Financial Accomplishments',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildFinancialAccomplishments(project),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Contact Information',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text('Contact Information'),
                subtitle: Text(project.contactInformation ?? 'N/A'),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Attachments',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text('Attachments'),
                subtitle: Text(project.notes ?? 'N/A'),
              ),
            ]),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Notes',
              style: TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text('Notes'),
                subtitle: Text(project.notes ?? 'N/A'),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildRegionalTable(FullProject project) {
    final List<RegionalInvestment> regionInvestments = project.regions;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border:
        TableBorder.all(color: Theme
            .of(context)
            .primaryColor, width: 0.5),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          const TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Region'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2022 & Prior',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2023',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2024',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2025',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2026',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2027',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2028',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2029 & Beyond',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Total',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          ...regionInvestments.map((e) {
            return TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.region?.label ?? 'N/A'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2022),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2023),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2024),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2025),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2026),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2027),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2028),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2029),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.total),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFinancialTable(FullProject project) {
    final List<FsInvestment> fsInvestments = project.fsInvestments;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border:
        TableBorder.all(color: Theme
            .of(context)
            .primaryColor, width: 0.5),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          const TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Funding Source'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2022 & Prior',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2023',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2024',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2025',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2026',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2027',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2028',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '2029 & Beyond',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Total',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          ...fsInvestments.map((e) {
            return TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.fundingSource?.label ?? 'N/A'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2022),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2023),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2024),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2025),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2026),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2027),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2028),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.y2029),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ref.watch(numberFormatterProvider).format(e.total),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFinancialAccomplishments(project) {
    final FinancialAccomplishment financialAccomplishment =
        project.financialAccomplishment;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(
          color: Theme
              .of(context)
              .primaryColor,
          width: 0.5,
        ),
        children: [
          const TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Year'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'National Expenditure Program',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'General Appropriations Act',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Actual Disbursement',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2023'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.nep2023),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.gaa2023),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.disbursement2023),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2024'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.nep2024),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.gaa2024),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.disbursement2024),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2025'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.nep2025),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.gaa2025),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.disbursement2025),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2026'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.nep2026),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.gaa2026),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.disbursement2026),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2027'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.nep2027),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.gaa2027),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.disbursement2027),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2028'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.nep2028),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.gaa2028),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref
                        .watch(numberFormatterProvider)
                        .format(financialAccomplishment.disbursement2028),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          // Totals Row
          TableRow(children: [
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Total'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ref
                      .watch(numberFormatterProvider)
                      .format(financialAccomplishment.nepTotal),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ref
                      .watch(numberFormatterProvider)
                      .format(financialAccomplishment.gaaTotal),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ref
                      .watch(numberFormatterProvider)
                      .format(financialAccomplishment.disbursementTotal),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildChat() {
    final liveComments = ref.watch(realTimeCommentsProvider);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      right: _isExpanded ? 0 : -368,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 600,
          width: 360,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .canvasColor,
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: _toggleExpanded,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              // Your expanded chat widget goes here
              Expanded(
                child: liveComments.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) =>
                      Center(
                        child: Text("Error: ${error.toString()}: $stackTrace"),
                      ),
                  data: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('Hooray! No comments here.'),
                      );
                    }

                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final comment = data[index];

                        if (comment.userId == 1) {
                          return ListTile(
                            subtitle: Text(
                              comment.comment,
                              textAlign: TextAlign.end,
                            ),
                          );
                        }

                        return ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(comment.user.firstName ?? ''),
                          subtitle: Text(comment.comment),
                          trailing: Text(
                            ref.watch(dateFormatterProvider).format(
                              comment.updatedAt,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.send),
                  ),
                  onFieldSubmitted: (String? value) {
                    debugPrint(value);
                    if (value == null) {
                      return;
                    }
                    //

                    ref
                        .read(newCommentRepositoryProvider)
                        .addComment(CommentRequest(comment: value));

                    _textEditingController.clear();
                  },
                ),
              ),
              // Add more chat messages as needed
            ],
          ),
        ),
      ),
    );
  }
}
