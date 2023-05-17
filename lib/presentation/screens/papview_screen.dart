import 'package:auto_route/annotations.dart';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:pips/data/data_sources/pusher_client.dart';
import 'package:pips/data/repositories/newcomment_repository.dart';
import 'package:pips/data/requests/comment_request.dart';
import 'package:pips/data/responses/project_response.dart';
import 'package:pips/domain/models/fullproject.dart';
import 'package:pips/domain/models/project.dart';
import 'package:pips/presentation/controllers/comments_controller.dart';
import 'package:pips/presentation/controllers/viewpap_controller.dart';

import '../../application/functions.dart';

@RoutePage()
class PapViewScreen extends ConsumerStatefulWidget {
  const PapViewScreen({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  ConsumerState<PapViewScreen> createState() => _PapViewScreenState();
}

class _PapViewScreenState extends ConsumerState<PapViewScreen> {
  bool _isExpanded = false;

  final List<Message> _messages = [];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _messages.addAll([
      Message(
        sender: 'John Doe',
        message: 'Hello! How can I help you?',
        timestamp: DateTime.now(),
      ),
      Message(
        sender: 'Jane Smith',
        message: 'I have a question about the product.',
        timestamp: DateTime.now(),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();

    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pusherClient = ref.watch(pusherClientProvider);

    final allChannels = <Channel>[
      pusherClient.publicChannel('PIPSv3.Public'),
    ];

    pusherClient.onConnectionEstablished.listen((_) {
      for (final channel in allChannels) {
        channel.subscribeIfNotUnsubscribed();
      }
    });

    final subscription = pusherClient
        .publicChannel('PIPSv3.Public')
        .bindToAll()
        .listen((event) {});

    subscription.onData((ChannelReadEvent event) {
      debugPrint(event.toString());
    });

    final valueAsync =
    ref.watch(viewPapControllerProvider(widget.project.uuid));

    return Scaffold(
      appBar: AppBar(
        title: const Text('View PAP'),
        scrolledUnderElevation: 0.0,
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
          valueAsync.when(
              data: (data) {
                return _buildShow(data);
              },
              error: (error, stacktrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () => const CircularProgressIndicator()),
          // chat box
          _buildChatBox()
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
                subtitle: Text(project.bases.map((e) => e.label).join(', ')),
                title: const Text('Basis for Implementation'),
              ),
              ListTile(
                subtitle: Text(project.description ?? 'N/A'),
                title: const Text('Description'),
              ),
              ListTile(
                subtitle: Text(project.totalCost?.toString() ?? 'N/A'),
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
                subtitle:
                Text(project.operatingUnits.map((e) => e.label).join(', ')),
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
                subtitle:
                Text(project.locations.map((e) => e.label).join(', ')),
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
                  subtitle:
                  Text(project.pdpChapters.map((e) => e.label).join(', ')),
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
                  )),
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
                    )),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2022.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2023.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2024.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2025.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2026.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2027.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.y2028.toString(),
                        textAlign: TextAlign.end,
                      ),
                    )),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2029.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.total().toString(),
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
                  )),
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
                    )),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2022.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2023.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2024.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2025.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2026.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2027.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.y2028.toString(),
                        textAlign: TextAlign.end,
                      ),
                    )),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.y2029.toString(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.total().toString(),
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

  Widget _buildChatBox() {
    final commentsAsync =
    ref.watch(commentsControllerProvider(widget.project.uuid));

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
                        onPressed: () {
                          setState(() {
                            _isExpanded = false;
                          });
                        },
                        icon: const Icon(Icons.close)),
                  ),
                ],
              ),
              // Your expanded chat widget goes here
              Expanded(
                child: commentsAsync.when(data: (data) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      final comment = data.data[index];

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
                            formatDate(comment.updatedAt.toIso8601String())),
                      );
                    },
                  );
                }, error: (error, stacktrace) {
                  return Container();
                }, loading: () {
                  return const CircularProgressIndicator();
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration:
                  const InputDecoration(suffixIcon: Icon(Icons.send)),
                  onFieldSubmitted: (String? value) {
                    debugPrint(value);
                    if (value == null) {
                      return;
                    }
                    //

                    ref.read(newCommentRepositoryProvider).addComment(
                      widget.project.uuid,
                      CommentRequest(comment: value),
                    );

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

class Message {
  final String sender;
  final String message;
  final DateTime timestamp;

  Message({
    required this.sender,
    required this.message,
    required this.timestamp,
  });
}
