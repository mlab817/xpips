import 'package:auto_route/annotations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/functions.dart';
import '../../presentation/widgets/loading_dialog.dart';
import '../../presentation/widgets/logout_button.dart';
import '../application/providers/projects_provider.dart';
import '../domain/models/project.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final valueAsync = ref.watch(projectControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // TODO: show search delegate
            showSearch(context: context, delegate: _HomeSearchDelegate());
          },
          icon: const Icon(Icons.search),
        ),
        title: const Text('Home'),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: valueAsync.when(data: (data) {
          return ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: data.data.length + 1,
              itemBuilder: (context, index) {
                if (index == data.data.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        ref.read(projectControllerProvider.notifier).nextPage();
                      },
                      child: const Text('Load More'),
                    ),
                  );
                }

                final project = data.data[index];

                return ProjectListTile(project: project);
              });
        }, error: (error, stackTrace) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error!', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 30),
              Text(error.toString()),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(projectControllerProvider.notifier).getAll();
                },
                child: const Text('Try Again'),
              ),
            ],
          ));
        }, loading: () {
          return const LoadingOverlay();
        }),
      ),
    );
  }
}

class _HomeSearchDelegate extends SearchDelegate {
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
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
    // TODO: implement initState
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
        isThreeLine: true,
        minLeadingWidth: 120,
        leading: width >= 768 ? Text(_project.user?.fullname ?? 'User') : null,
        title: RichText(
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
        subtitle: (width < 768)
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
        trailing: _hovered
            ? _buildControls()
            : Text(
                formatDate(_project.updatedAt),
              ),
        onTap: () {
          // add default behavior or create card?
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(_project.title),
                content: Column(
                  children: [
                    Text(
                      _project.description ?? 'No description',
                    ),
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
    return SizedBox(
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
