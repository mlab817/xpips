import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pips/application/providers/searchhistory_provider.dart';
import 'package:pips/domain/models/pipsstatus.dart';
import 'package:pips/presentation/controllers/options_controller.dart';

import '../../application/app_router.dart';
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

  final TextEditingController _searchController = TextEditingController();

  void _showFilters() {
    final optionsAsync = ref.watch(optionsControllerProvider);

    showModalBottomSheet(
        showDragHandle: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return optionsAsync.when(
              data: (data) {
                return Column(children: [
                  Row(
                    children: [
                      const Text('Apply Filters'),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ]);
              },
              error: (error, stacktrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () => const CircularProgressIndicator());
        });
  }

  @override
  void initState() {
    super.initState();

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

    final projectsRequest = ref.watch(projectsRequestControllerProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: _showFilters,
            icon: const Icon(Icons.tune_outlined),
          ),
        ],
      ),
      // show drawer for smaller screens
      drawer: width < 768
          ? Drawer(
              child: menuAsync.when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.data.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ListTile(
                          title: const Text('All'),
                          dense: true,
                          selected: ref
                                  .watch(projectsRequestControllerProvider)
                                  .pipsStatuses
                                  ?.isEmpty ??
                              false,
                          selectedTileColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        );
                      }

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
                    ListTile(
                      dense: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      selected: ref
                              .watch(projectsRequestControllerProvider)
                              .pipsStatuses
                              ?.isEmpty ??
                          false,
                      title: const Text('ALL'),
                      selectedTileColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      onTap: () {
                        setState(() {
                          _pipsStatus = null;
                        });

                        // set pips status to current id and reset to page 1
                        ref
                            .read(projectsRequestControllerProvider.notifier)
                            .update(
                          pipsStatuses: [],
                          page: 1,
                        );
                      },
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
                                  projectsRequest.pipsStatuses!.isNotEmpty &&
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
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
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
                        _pipsStatus?.name.toUpperCase() ?? 'ALL',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                              letterSpacingFactor: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      _buildSearchBox(),
                      const Spacer(),
                      const SizedBox(
                        width: 10,
                      ),
                      _buildPageSelector(),
                    ],
                  ),
                ),
              ),
              // loading indicator
              // if (valueAsync.isLoading) const LinearProgressIndicator(),
              // content
              _buildContent(),
            ]),
          ),
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
          return SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: data.data.length,
              itemBuilder: (context, index) {
                final project = data.data[index];

                return ProjectListTile(project: project);
              },
            ),
          );
        },
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildPageSelector() {
    final valueAsync = ref.watch(homeScreenControllerProvider);

    return valueAsync.when(
      data: (data) {
        final int currentPage = data.meta.pagination.current;
        final int lastPage = data.meta.pagination.last;

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
                  child: Text("Page $currentValue of $lastPage"));
            }),
            onChanged: (int? newValue) {
              ref
                  .read(projectsRequestControllerProvider.notifier)
                  .update(page: newValue);
            });
      },
      error: (error, stacktrace) {
        return Text(error.toString());
      },
      loading: () => const Row(
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            width: 10,
          ),
          Text('Loading...'),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Expanded(
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: ref.watch(projectsRequestControllerProvider).q != null &&
                  ref.watch(projectsRequestControllerProvider).q!.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    ref
                        .read(projectsRequestControllerProvider.notifier)
                        .clearQuery();
                    _searchController.clear();
                  })
              : null,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'Type and press enter to search',
        ),
        onFieldSubmitted: (String value) {
          // update the query value in the provider
          ref.read(projectsRequestControllerProvider.notifier).update(q: value);
        },
      ),
    );
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
