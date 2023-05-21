import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pips/application/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/config.dart';
import '../../application/functions.dart';
import '../../domain/models/project.dart';
import '../controllers/viewpap_controller.dart';

class ProjectListTile extends ConsumerStatefulWidget {
  const ProjectListTile({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  ConsumerState<ProjectListTile> createState() => _ProjectListTileState();
}

class _ProjectListTileState extends ConsumerState<ProjectListTile> {
  late Project _project;

  Future<void> _openInNewWindow() async {
    final rawUrl = "${Config.baseUrl}/generate-pdf/${_project.uuid}";
    final url = Uri.parse(rawUrl);
    //
    if (await canLaunchUrl(url)) {
      // TODO: check why this is not working on android
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Operation is not supported.')));
      }
    }
  }

  void _confirmDelete() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Deletion'),
            content: const Text('Are you sure you want to delete this PAP?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  // TODO: handle deletion
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            _project.title,
            overflow: TextOverflow.ellipsis,
          ),
          content: SizedBox(
            width: double.infinity,
            child: Column(
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
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                      _project.contactInformation ?? 'No contact information'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(_project.notes ?? 'No notes'),
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
          ),
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
            IconButton(
              onPressed: _openInNewWindow,
              icon: const Icon(Icons.picture_as_pdf),
              tooltip: 'PDF',
            ),
            IconButton(
              onPressed: () {
                ref.read(selectedProjectProvider.notifier).update(_project);
                AutoRouter.of(context).push(const PapViewRoute());
              },
              icon: const Icon(Icons.visibility),
              tooltip: 'View',
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _project = widget.project;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: (width < 768) ? 0.75 : 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ref.read(selectedProjectProvider.notifier).update(_project);

              AutoRouter.of(context).push(const PapViewRoute());
            },
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.visibility,
          ),
          SlidableAction(
            onPressed: (context) {
              _openInNewWindow();
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.picture_as_pdf,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (context) {
              _confirmDelete();
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        minVerticalPadding: 8.0,
        tileColor: _project.isRead
            ? Colors.transparent
            : Theme.of(context).hoverColor.withAlpha(9),
        trailing: Text(formatDate(_project.updatedAt)),
        leading: CircleAvatar(
          child: Text(
            _project.user?.fullname?.substring(0, 2).toUpperCase() ?? 'NA',
          ),
        ),
        subtitle: Text(
          _project.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        title: Text(
          _project.office?.acronym.toUpperCase() ?? 'OFFICE',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        onTap: _showDialog,
      ),
    );
  }
}
