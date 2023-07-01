import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/app_router.dart';
import '../../../application/providers/searchhistory_provider.dart';
import '../../../domain/models/models.dart';
import '../../controllers/deadline_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/homesearch_controller.dart';
import '../../controllers/options_controller.dart';
import '../../controllers/pipolstatus_controller.dart';
import '../../controllers/updatingperiod_controller.dart';
import '../../widgets/loading_dialog.dart';
import '../../widgets/project_list_tile.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  PipsStatus? _pipsStatus;
  PipolStatus? _pipolStatus;

  final TextEditingController _searchController = TextEditingController();

  void _showFilters() {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      context: context,
      builder: (context) => const ProjectRequestBottomSheet(),
    );
  }

  @override
  void initState() {
    super.initState();

    // initialize list of search history
    Future.delayed(Duration.zero, () {
      ref.read(searchHistoryProvider.notifier).retrieve();
      _searchController.text =
          ref.watch(projectsRequestControllerProvider).q ?? '';
    });
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;

    final menuAsync = ref.watch(pipsStatusControllerProvider);
    final pipolAsync = ref.watch(pipolStatusControllerProvider);

    final projectsRequest = ref.watch(projectsRequestControllerProvider);

    // trigger optionsAsync so that showBottomSheet is available any time
    ref.watch(optionsControllerProvider);

    // fetch updating period provider
    ref.watch(updatingPeriodProvider);

    // fetch deadline provider
    ref.watch(deadlineProvider);

    final currentPage = ref
            .watch(homeScreenControllerProvider)
            .value
            ?.meta
            .pagination
            .current ??
        1;
    final lastPage =
        ref.watch(homeScreenControllerProvider).value?.meta.pagination.last ??
            1;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('HOME'),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: _showFilters,
            icon: const Icon(Icons.tune_outlined),
          ),
          _buildSearchBox(),
        ],
      ),
      // show drawer for smaller screens
      drawer: width < 768
          ? Drawer(
              child: menuAsync.when(
                data: (data) {
                  if (menuAsync.isRefreshing) {
                    return const Center(
                      child: LoadingOverlay(),
                    );
                  }

                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
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
                            projectsRequest.pipsStatuses!.isNotEmpty &&
                            projectsRequest.pipsStatuses![0] ==
                                data.data[index - 1].id,
                        title: Text(data.data[index - 1].name),
                        trailing:
                            Text(data.data[index - 1].projectsCount.toString()),
                        selectedTileColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                        onTap: () {
                          setState(() {
                            _pipsStatus = data.data[index - 1];
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
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
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
          if (width >= 768) _sidePanel(),
          // content
          Expanded(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              // top controls
              _topNavigator(currentPage, lastPage),
              // content
              _buildContent(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _sidePanel() {
    final menuAsync = ref.watch(pipsStatusControllerProvider);
    final pipolAsync = ref.watch(pipolStatusControllerProvider);
    final projectsRequest = ref.watch(projectsRequestControllerProvider);

    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).colorScheme.background,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: FilledButton.icon(
                        onPressed: () {
                          AutoRouter.of(context).push(const NewPapRoute());
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('New'),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // reload the pips status
                        ref.invalidate(pipsStatusControllerProvider);

                        // reload pipol Status
                        ref.invalidate(pipolStatusControllerProvider);
                      },
                      icon: const Icon(Icons.refresh),
                      tooltip: 'Reload',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // PIPS STATUS MENU
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'PIPS STATUS',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              menuAsync.when(
                data: (data) {
                  if (menuAsync.isRefreshing) {
                    return const LoadingOverlay();
                  }

                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
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
                            projectsRequest.pipsStatuses!.isNotEmpty &&
                            projectsRequest.pipsStatuses![0] ==
                                data.data[index].id,
                        title: Text(data.data[index].name),
                        trailing:
                            Text(data.data[index].projectsCount.toString()),
                        selectedTileColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                        onTap: _pipsStatus == data.data[index]
                            ? null
                            : () {
                                setState(() {
                                  _pipsStatus = data.data[index];
                                });

                                // set pips status to current id and reset to page 1
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(
                                  pipsStatuses: [data.data[index].id],
                                  pipolStatuses: [], // clear pipol status
                                  page: 1,
                                );
                              },
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LoadingOverlay(),
                  ),
                ),
              ),
              // PIPOL STATUS MENU
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'PIPOL STATUS',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              pipolAsync.when(
                data: (data) {
                  if (pipolAsync.isRefreshing) {
                    return const Center(child: LoadingOverlay());
                  }

                  if (data.data.isEmpty) {
                    return const Center(
                      child: Text('NO ITEMS TO SHOW.'),
                    );
                  }

                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
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
                        selected: projectsRequest.pipolStatuses != null &&
                            projectsRequest.pipolStatuses!.isNotEmpty &&
                            projectsRequest.pipolStatuses![0] ==
                                data.data[index].id,
                        title: Text(data.data[index].name),
                        trailing:
                            Text(data.data[index].projectsCount.toString()),
                        selectedTileColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                        onTap: _pipolStatus == data.data[index]
                            ? null
                            : () {
                                setState(() {
                                  _pipolStatus = data.data[index];
                                });

                                // set pips status to current id and reset to page 1
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(
                                        pipolStatuses: [data.data[index].id],
                                        pipsStatuses: [], // clear pips status
                                        page: 1);
                              },
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Column(
                    children: [
                      Text(error.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          ref.invalidate(homeScreenControllerProvider);
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('TRY AGAIN'),
                      ),
                    ],
                  ),
                ),
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LoadingOverlay(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topNavigator(currentPage, lastPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Spacer(),
          DropdownButton<String>(
              icon: const Icon(Icons.sort),
              items: const [
                DropdownMenuItem(
                  value: 'title',
                  child: Text('Title'),
                ),
                DropdownMenuItem(
                  value: 'office_id',
                  child: Text('Office'),
                ),
                DropdownMenuItem(
                  value: 'updated_at',
                  child: Text('Date Last Updated'),
                ),
              ],
              value: ref.watch(projectsRequestControllerProvider).sort,
              hint: const Text('Sort by'),
              onChanged: (String? value) {
                ref
                    .read(projectsRequestControllerProvider.notifier)
                    .update(sort: value);
              }),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: currentPage == 1
                  ? null
                  : () {
                      ref
                          .read(projectsRequestControllerProvider.notifier)
                          .previousPage();
                    },
              icon: const Icon(Icons.chevron_left)),
          _buildPageSelector(),
          IconButton(
              onPressed: currentPage == lastPage
                  ? null
                  : () {
                      ref
                          .read(projectsRequestControllerProvider.notifier)
                          .nextPage();
                    },
              icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }

  // this should be replaceable by the project details screen
  Widget _buildContent() {
    final projectsAsync = ref.watch(homeScreenControllerProvider);

    return Expanded(
      child: projectsAsync.when(
        data: (data) {
          if (data.data.isEmpty) {
            return const Center(
              child: Text('NO PROJECTS HERE.'),
            );
          }

          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              final project = data.data[index];

              return ProjectListTile(project: project);
            },
          );
        },
        error: (error, _) => Center(
            child: Column(
          children: [
            Text(error.toString()),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {
                // refresh the provider
                ref.invalidate(homeScreenControllerProvider);
              },
              child: const Text('TRY AGAIN'),
            ),
          ],
        )),
        loading: () => const Center(child: LoadingOverlay()),
      ),
    );
  }

  Widget _buildPageSelector() {
    // get the currentPage from request provider
    final currentPage = ref
            .watch(homeScreenControllerProvider)
            .value
            ?.meta
            .pagination
            .current ??
        1;

    final lastPage =
        ref.watch(homeScreenControllerProvider).value?.meta.pagination.last ??
            1;

    return DropdownButton(
        value: currentPage,
        focusColor: Colors.transparent,
        underline: Container(),
        items: List.generate(lastPage, (index) {
          final currentValue = index + 1;
          return DropdownMenuItem<int>(
              enabled: currentValue != currentPage,
              // disable when currently selected
              value: currentValue,
              child: Text("$currentValue/$lastPage"));
        }),
        onChanged: (int? newValue) {
          ref
              .read(projectsRequestControllerProvider.notifier)
              .update(page: newValue);
        });
  }

  Widget _buildSearchBox() {
    return IconButton(
      onPressed: () {
        showSearch(context: context, delegate: _HomeScreenSearchDelegate());
      },
      icon: const Icon(
        Icons.search,
      ),
    );
  }
}

class ProjectRequestBottomSheet extends ConsumerStatefulWidget {
  const ProjectRequestBottomSheet({super.key});

  @override
  ConsumerState<ProjectRequestBottomSheet> createState() =>
      _ProjectRequestBottomSheetState();
}

class _ProjectRequestBottomSheetState
    extends ConsumerState<ProjectRequestBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final optionsAsync = ref.watch(optionsControllerProvider);

    // state of selections
    var selection = ref.watch(projectsRequestControllerProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('APPLY FILTERS'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('DISMISS'),
          ),
        ],
      ),
      body: optionsAsync.when(
          data: (data) {
            return SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'OFFICES',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.offices?.map((office) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    value: selection.offices
                                            ?.contains(office.value) ??
                                        false,
                                    onChanged: (bool? value) {
                                      final updatedSelection = ref
                                              .watch(
                                                  projectsRequestControllerProvider)
                                              .offices
                                              ?.toList() ??
                                          [];

                                      if (value != null && value) {
                                        updatedSelection.add(office.value);
                                      } else {
                                        updatedSelection.remove(office.value);
                                      }
                                      //
                                      ref
                                          .read(
                                              projectsRequestControllerProvider
                                                  .notifier)
                                          .update(offices: updatedSelection);
                                    }),
                                Text(office.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'TYPE',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.types?.map((type) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value:
                                      selection.types?.contains(type.value) ??
                                          false,
                                  onChanged: (bool? value) {
                                    print('value: $value');

                                    final updatedSelection = ref
                                            .watch(
                                                projectsRequestControllerProvider)
                                            .offices
                                            ?.toList() ??
                                        [];

                                    if (value != null && value) {
                                      updatedSelection.add(type.value);
                                    } else {
                                      updatedSelection.remove(type.value);
                                    }
                                    //
                                    ref
                                        .read(projectsRequestControllerProvider
                                            .notifier)
                                        .update(types: updatedSelection);
                                  },
                                ),
                                Text(type.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'SPATIAL COVERAGE',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.spatialCoverages?.map((spatialCoverage) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    value: selection.spatialCoverages
                                            ?.contains(spatialCoverage.value) ??
                                        false,
                                    onChanged: (bool? value) {
                                      final updatedSelection = ref
                                              .watch(
                                                  projectsRequestControllerProvider)
                                              .spatialCoverages
                                              ?.toList() ??
                                          [];

                                      if (value != null && value) {
                                        updatedSelection
                                            .add(spatialCoverage.value);
                                      } else {
                                        updatedSelection
                                            .remove(spatialCoverage.value);
                                      }
                                      //
                                      ref
                                          .read(
                                              projectsRequestControllerProvider
                                                  .notifier)
                                          .update(
                                              spatialCoverages:
                                                  updatedSelection);
                                    }),
                                Text(spatialCoverage.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'PROGRAMMING DOCUMENTS',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .pip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(pip: value);
                              },
                            ),
                            const Text('PIP'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .cip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(cip: value);
                              },
                            ),
                            const Text('CIP'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .trip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(trip: value);
                              },
                            ),
                            const Text('TRIP'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              tristate: true,
                              value: ref
                                  .watch(projectsRequestControllerProvider)
                                  .rdip,
                              onChanged: (bool? value) {
                                ref
                                    .read(projectsRequestControllerProvider
                                        .notifier)
                                    .update(rdip: value);
                              },
                            ),
                            const Text('RDIP'),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'MAIN FUNDING SOURCE',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.fundingSources?.map((fundingSource) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: ref
                                          .watch(
                                              projectsRequestControllerProvider)
                                          .fundingSources
                                          ?.contains(fundingSource.value) ??
                                      false,
                                  onChanged: (bool? value) {
                                    final updatedSelection = ref
                                            .watch(
                                                projectsRequestControllerProvider)
                                            .fundingSources
                                            ?.toList() ??
                                        [];

                                    if (value != null && value) {
                                      updatedSelection.add(fundingSource.value);
                                    } else {
                                      updatedSelection
                                          .remove(fundingSource.value);
                                    }
                                    //
                                    ref
                                        .read(projectsRequestControllerProvider
                                            .notifier)
                                        .update(
                                            fundingSources: updatedSelection);
                                  },
                                ),
                                Text(fundingSource.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'PAP STATUS',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Wrap(
                      children: data.projectStatuses?.map((projectStatus) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: ref
                                          .watch(
                                              projectsRequestControllerProvider)
                                          .projectStatuses
                                          ?.contains(projectStatus.value) ??
                                      false,
                                  onChanged: (bool? value) {
                                    final updatedSelection = ref
                                            .watch(
                                                projectsRequestControllerProvider)
                                            .projectStatuses
                                            ?.toList() ??
                                        [];

                                    if (value != null && value) {
                                      updatedSelection.add(projectStatus.value);
                                    } else {
                                      updatedSelection
                                          .remove(projectStatus.value);
                                    }

                                    ref
                                        .read(projectsRequestControllerProvider
                                            .notifier)
                                        .update(
                                            projectStatuses: updatedSelection);
                                  },
                                ),
                                Text(projectStatus.label),
                              ],
                            );
                          }).toList() ??
                          [],
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, _) {
            return Center(
              child: Column(
                children: [
                  Text(error.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                    onPressed: () {
                      ref.invalidate(optionsControllerProvider);
                    },
                    child: const Text('TRY AGAIN'),
                  ),
                ],
              ),
            );
          },
          loading: () => const LoadingOverlay()),
    );
  }
}

class _HomeScreenSearchDelegate extends SearchDelegate<void> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.close,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SearchResultScreen(
          query: query,
        );
      }));
    });

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class SearchResultScreen extends ConsumerStatefulWidget {
  const SearchResultScreen({
    super.key,
    required this.query,
  });

  final String query;

  @override
  ConsumerState<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends ConsumerState<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    final results = ref.watch(homeSearchProvider(query: widget.query));

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results for "${widget.query}"'),
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              AutoRouter.of(context).push(const HomeRoute());
            }),
      ),
      body: results.when(data: (data) {
        final projects = data.data;

        return ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final Project project = projects[index];

            return ListTile(
              title: Text(project.title),
              subtitle: Text(project.office?.acronym ?? ''),
              trailing: Text(project.pipsStatus?.label ?? ''),
              onTap: () {
                AutoRouter.of(context).push(
                  PapViewRoute(uuid: project.uuid),
                );
              },
            );
          },
        );
      }, error: (error, stacktrace) {
        return Container();
      }, loading: () {
        return const LoadingOverlay();
      }),
    );
  }
}

class SearchIntent extends Intent {}
