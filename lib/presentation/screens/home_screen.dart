import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/config.dart';
import 'package:pips/domain/models/pagination.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../application/functions.dart';
import '../../../presentation/widgets/logout_button.dart';
import '../../application/app_router.dart';
import '../../domain/models/project.dart';
import '../controllers/home_controller.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 1;
  final int _perPage = 25;
  int pipsStatus = 1;

  List<Project>? _projects;
  Pagination? _pagination;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    final menuAsync = ref.watch(pipsStatusControllerProvider);
    final valueAsync = ref.watch(homeScreenControllerProvider);
    final projectsRequest = ref.watch(projectsRequestControllerProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('Home'),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pips status navigation
            SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: FilledButton(
                            onPressed: () {
                              AutoRouter.of(context)
                                  .push(const NewProjectRoute());
                            },
                            child: const Text('New'),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(pipsStatusControllerProvider.notifier)
                                .get();
                          },
                          icon: const Icon(Icons.refresh),
                          tooltip: 'Reload',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    menuAsync.when(
                        data: (data) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                ),
                                selected:
                                    projectsRequest.pipsStatuses != null &&
                                        projectsRequest.pipsStatuses![0] ==
                                            data.data[index].id,
                                title: Text(data.data[index].name),
                                trailing: Text(
                                    data.data[index].projectsCount.toString()),
                                selectedTileColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                                onTap: () {
                                  setState(() {
                                    pipsStatus = data.data[index].id;
                                  });

                                  // set pips status to current id and reset to page 1
                                  ref
                                      .read(projectsRequestControllerProvider
                                          .notifier)
                                      .update(
                                          pipsStatuses: [data.data[index].id],
                                          page: 1);
                                },
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) => Center(
                              child: Text(error.toString()),
                            ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator())),
                  ],
                ),
              ),
            ),
            // content
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  // top controls
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // showSearch
                              showSearch(
                                  context: context,
                                  delegate: _HomeSearchDelegate(
                                      ref: ref, projects: _projects ?? []));
                            },
                            icon: const Icon(Icons.search),
                          ),
                          const Spacer(),
                          // page numbers
                          const SizedBox(
                            width: 10,
                          ),
                          // TODO: fix this
                          _pagination != null
                              ? _buildPageSelector()
                              : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: _page == 1
                                  ? null
                                  : () {
                                      ref
                                          .read(
                                              projectsRequestControllerProvider
                                                  .notifier)
                                          .update(page: _page--);
                                    },
                              icon: const Icon(Icons.chevron_left)),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: _page == _pagination?.last
                                  ? null
                                  : () {
                                      ref
                                          .read(
                                              projectsRequestControllerProvider
                                                  .notifier)
                                          .update(page: _page++);
                                    },
                              icon: const Icon(Icons.chevron_right))
                        ],
                      ),
                    ),
                  ),
                  // loading indicator
                  // if (valueAsync.isLoading) const LinearProgressIndicator(),
                  // content
                  Expanded(
                    child: valueAsync.when(
                      data: (data) {
                        setState(() {
                          _projects = data.data;
                          _pagination = data.meta.pagination;
                        });

                        return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: data.data.length,
                            itemBuilder: (context, index) {
                              final project = data.data[index];

                              return ProjectListTile(project: project);
                            });
                      },
                      error: (error, _) =>
                          Center(child: Text(error.toString())),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageSelector() {
    if (_pagination == null) {
      return Container();
    }

    final lastPage = _pagination!.last;

    return DropdownButton(
        value: _page,
        focusColor: Colors.transparent,
        underline: Container(),
        items: List.generate(lastPage, (index) {
          return DropdownMenuItem<int>(
              value: index + 1,
              child: Text("Page ${index + 1} of ${_pagination!.last}"));
        }),
        onChanged: (int? newValue) {
          setState(() {
            _page = newValue!;
          });

          ref
              .read(projectsRequestControllerProvider.notifier)
              .update(page: newValue);
        });
  }
}

class _HomeSearchDelegate extends SearchDelegate {
  _HomeSearchDelegate({required this.ref, required this.projects});

  final WidgetRef ref;
  final List<Project> projects;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = ref.watch(homeScreenControllerProvider);

    return results.when(
        data: (data) {
          return ListView.builder(
              itemCount: data.data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(data.data[index].title));
              });
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child:
            Text('Start typing for suggestions. Press enter to search more.'),
      );
    }

    // pass data from home
    final suggestions = projects
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(suggestions[index].title));
        });
  }
}

class ProjectListTile extends StatefulWidget {
  const ProjectListTile({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  State<ProjectListTile> createState() => _ProjectListTileState();
}

class _ProjectListTileState extends State<ProjectListTile> {
  late Project _project;

  bool _hovered = false;

  @override
  void initState() {
    super.initState();

    _project = widget.project;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return MouseRegion(
      onHover: (PointerHoverEvent event) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (PointerExitEvent event) {
        setState(() {
          _hovered = false;
        });
      },
      child: ListTile(
        minVerticalPadding: 8.0,
        tileColor: _project.isRead ? Colors.white : Colors.transparent,
        isThreeLine: width >= 768,
        minLeadingWidth: 150,
        leading: width >= 768
            ? Text(
                _project.user?.fullname ?? 'User',
              )
            : null,
        title: width >= 768
            ? RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: _project.office?.acronym ?? 'OFFICE',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.apply(color: Colors.black)),
                    TextSpan(
                        text: ' - ',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.apply(color: Colors.black45)),
                    TextSpan(
                        text: _project.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.apply(color: Colors.black)),
                  ],
                ),
              )
            : Text(_project.user?.fullname ?? 'User'),
        subtitle: width >= 768
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (width < 768)
                      ? Text(
                          'Added by ${_project.user?.fullname ?? 'User'}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        )
                      : Text(
                          _project.description ?? 'No description',
                          maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.attachment),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Chip(label: Text('Project Proposal')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Chip(label: Text('Right of Way')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Chip(label: Text('RDC Endorsement')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Chip(label: Text('ICC Approval')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Chip(label: Text('MOU/MOA')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Chip(label: Text('Feasibility Study')),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: _project.office?.acronym ?? 'OFFICE',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(color: Colors.black)),
                    TextSpan(
                        text: ' - ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(color: Colors.black45)),
                    TextSpan(
                        text: _project.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(color: Colors.black)),
                  ],
                ),
              ),
        trailing: _hovered
            ? _buildControls()
            : width >= 768
                ? Text(
                    formatDate(_project.updatedAt),
                  )
                : null,
        onTap: () {
          // add default behavior or create card?
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Row(
                  children: [
                    Expanded(
                        child: Text(
                      _project.title,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      tooltip: 'Delete',
                    ),
                    IconButton(
                      onPressed: () async {
                        final rawUrl =
                            "${Config.baseUrl}/generate-pdf/${_project.uuid}";
                        final url = Uri.parse(rawUrl);
                        //
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Operation is not supported.')));
                          }
                        }
                      },
                      icon: const Icon(Icons.picture_as_pdf),
                      tooltip: 'PDF',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      tooltip: 'Edit',
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _project.office?.name ?? 'No office',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _project.description ?? 'No description',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'PIPOL Code: ${_project.pipolCode ?? 'N/A'}',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total Cost: ${_project.totalCost ?? 'N/A'}',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(_project.contactInformation ??
                          'No contact information'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.download),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: double.maxFinite,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       itemCount: 5,
                    //       itemBuilder: (context, index) {
                    //         //
                    //         return IconButton(
                    //             onPressed: () {},
                    //             icon: const Icon(Icons.download));
                    //       }),
                    // ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildControls() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // TODO: handle action
            },
            icon: const Icon(
              Icons.visibility_outlined,
              size: 22,
            ),
            tooltip: 'View',
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // TODO: handle action
            },
            icon: const Icon(
              Icons.edit_outlined,
              size: 22,
            ),
            tooltip: 'Edit',
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // TODO: handle action
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm Deletion'),
                      content: const Text(
                          'Are you sure you want to delete this PAP?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel')),
                        FilledButton(
                            onPressed: () {
                              // handle project deletion
                            },
                            child: const Text('Confirm')),
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.delete_outline,
              size: 22,
            ),
            tooltip: 'Delete',
          ),
        ],
      ),
    );
  }
}
