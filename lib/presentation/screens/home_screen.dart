import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pips/domain/models/pagination.dart';
import 'package:pips/domain/models/pipsstatus.dart';
import 'package:pips/presentation/controllers/options_controller.dart';

import '../../application/app_router.dart';
import '../../domain/models/project.dart';
import '../controllers/home_controller.dart';
import '../widgets/project_list_tile.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 1;
  final int _perPage = 25;
  PipsStatus? _pipsStatus = PipsStatus(id: 1, name: 'Draft', projectsCount: 0);

  List<Project>? _projects;
  Pagination? _pagination;

  void _showFilters() {
    final optionsAsync = ref.watch(optionsControllerProvider);

    showModalBottomSheet(
        showDragHandle: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;

    final menuAsync = ref.watch(pipsStatusControllerProvider);
    final valueAsync = ref.watch(homeScreenControllerProvider);
    final projectsRequest = ref.watch(projectsRequestControllerProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: _showFilters, icon: const Icon(Icons.tune_outlined)),
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: _HomeSearchDelegate(
                        ref: ref, projects: _projects ?? []));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      // show drawer for smaller screens
      drawer: width < 768
          ? Drawer(
              child: menuAsync.when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        selected: projectsRequest.pipsStatuses != null &&
                            projectsRequest.pipsStatuses![0] ==
                                data.data[index].id,
                        title: Text(data.data[index].name),
                        trailing:
                            Text(data.data[index].projectsCount.toString()),
                        selectedTileColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                        onTap: () {
                          setState(() {
                            _pipsStatus = data.data[index];
                          });

                          // set pips status to current id and reset to page 1
                          ref
                              .read(projectsRequestControllerProvider.notifier)
                              .update(
                                  pipsStatuses: [data.data[index].id], page: 1);

                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const NewPapRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // pips status navigation
          if (width >= 768)
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
                              AutoRouter.of(context).push(const NewPapRoute());
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
                              dense: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              selected: projectsRequest.pipsStatuses != null &&
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
                                  _pipsStatus = data.data[index];
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
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // content
          Expanded(
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
                      Text(
                        _pipsStatus?.name.toUpperCase() ?? 'NO STATUS SELECTED',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                              letterSpacingFactor: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      const Spacer(),
                      // TODO: fix this
                      _pagination != null ? _buildPageSelector() : Container(),
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

                    return SlidableAutoCloseBehavior(
                      closeWhenOpened: true,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: data.data.length,
                          itemBuilder: (context, index) {
                            final project = data.data[index];

                            return ProjectListTile(project: project);
                          }),
                    );
                  },
                  error: (error, _) => Center(child: Text(error.toString())),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ]),
          ),
        ],
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

  Widget _buildStatusSelector() {
    final menuAsync = ref.watch(pipsStatusControllerProvider);

    return menuAsync.when(
        data: (data) {
          return DropdownButton<PipsStatus>(
              value: _pipsStatus,
              focusColor: Colors.transparent,
              underline: Container(),
              items: List.generate(data.data.length, (index) {
                return DropdownMenuItem<PipsStatus>(
                    value: data.data[index],
                    child: Text(data.data[index].name.toUpperCase()));
              }),
              onChanged: (PipsStatus? newValue) {
                setState(() {
                  _pipsStatus = newValue!;
                });

                ref
                    .read(projectsRequestControllerProvider.notifier)
                    .update(pipsStatuses: [newValue!.id]);
              });
        },
        error: (error, stacktrace) {
          return Container();
        },
        loading: () => const Text('Loading'));
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

// TODO: Page selector not updating
