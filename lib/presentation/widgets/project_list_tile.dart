import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/app_router.dart';
import '../../application/providers/numberformatter_provider.dart';
import '../../application/config.dart';
import '../../application/functions.dart';
import '../../domain/models/models.dart';
import '../controllers/controllers.dart';

class ProjectListTile extends ConsumerStatefulWidget {
  const ProjectListTile({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  ConsumerState<ProjectListTile> createState() => _ProjectListTileState();
}

class _ProjectListTileState extends ConsumerState<ProjectListTile> {
  late Project _project;

  Future<void> _openInNewWindow() async {
    final rawUrl =
        "${ref.watch(configProvider).generatePdfBaseUrl}/${_project.uuid}";
    final url = Uri.parse(rawUrl);
    //
    if (await canLaunchUrl(url)) {
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
                  _handleDelete();
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        });
  }

  void _handleDelete() {
    final response = ref.watch(deleteProjectControllerProvider(_project.uuid));
  }

  void _showDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Label',
      pageBuilder: (context, _, __) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: Text(
                    _project.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  backgroundColor: Colors.transparent,
                  actions: [
                    IconButton(
                      onPressed: _project.permissions.delete
                          ? () {
                              _confirmDelete();
                            }
                          : null,
                      icon: const Icon(Icons.delete),
                      tooltip: 'Delete',
                    ),
                    IconButton(
                      onPressed: _openInNewWindow,
                      icon: const Icon(Icons.picture_as_pdf),
                      tooltip: 'PDF',
                    ),
                    IconButton(
                      onPressed: _project.permissions.view
                          ? () {
                              AutoRouter.of(context).push(PapViewRoute(
                                uuid: _project.uuid,
                              ));
                            }
                          : null,
                      icon: const Icon(Icons.visibility),
                      tooltip: 'View',
                    ),
                  ],
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    "Office: ${_project.office?.acronym ?? 'NO OFFICE'}",
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    "Description: ${_project.description ?? 'No description'}",
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    'PIPOL Code: ${_project.pipolCode ?? 'N/A'}',
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    'Total Cost: PHP ${ref.watch(numberFormatterProvider).format(_project.totalCost)}',
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                      "Contact Information: ${_project.contactInformation ?? 'NONE'}"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text("Notes: ${_project.notes ?? 'NO NOTES'}"),
                ),
              ],
            ),
          ),
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

    return ListTile(
      minVerticalPadding: 8.0,
      tileColor: _project.isRead
          ? Colors.transparent
          : Theme.of(context).hoverColor.withAlpha(9),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(formatDate(_project.updatedAt)),
          ],
        ),
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tooltip(
            message: _project.user?.fullname ?? 'NA',
            child: CircleAvatar(
              child: Text(
                _project.user?.avatar ?? 'NA',
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(
        _project.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      title: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  _project.office?.acronym.toUpperCase() ?? 'OFFICE',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                if (_project.commentsCount > 0)
                  Badge(
                    label: Text(
                      _project.commentsCount.toString(),
                      style: const TextStyle(fontSize: 8.0),
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline,
                      size: 20.0,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      onTap: _showDialog,
    );
  }
}
