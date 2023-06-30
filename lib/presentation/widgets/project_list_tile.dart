import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/app_router.dart';
import '../../application/providers/numberformatter_provider.dart';
import '../../application/config.dart';
import '../../application/functions.dart';
import '../../data/repositories/repositories.dart';
import '../../domain/models/models.dart';
import '../controllers/controllers.dart';
import 'loading_dialog.dart';

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

  Future<void> _handleDuplicate() async {
    print('executing duplicate now');

    // close first dialog
    Navigator.pop(context);

    // show loading dialog
    showGeneralDialog(
        context: context,
        pageBuilder: (context, _, __) {
          return const Center(child: LoadingOverlay());
        });

    //
    try {
      final response = await ref
          .read(projectRepositoryProvider)
          .duplicate(widget.project.uuid);

      final uuid = response.project.uuid;

      print(uuid);

      // invalidate homeScreen
      ref.invalidate(homeScreenControllerProvider);

      // show Dialog
      if (mounted) {
        // close the dialog
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content:
                    const Text('Successfully duplicated project. View now?'),
                actions: [
                  FilledButton(
                    onPressed: () {
                      // open next screen
                      AutoRouter.of(context).push(PapViewRoute(uuid: uuid));
                    },
                    child: const Text('GO NOW'),
                  ),
                ],
              );
            });
      }
    } catch (error) {
      // handle error
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.symmetric(horizontal: 8.0),
          title: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            title: Text(
              _project.title,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          actions: [
            if (!widget.project.readonly)
              FilledButton.icon(
                onPressed: _project.permissions.delete
                    ? () {
                        _confirmDelete();
                      }
                    : null,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.error),
                ),
              ),
            if (widget.project.readonly)
              FilledButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.tertiary,
                )),
                onPressed: _project.permissions.update
                    ? () {
                        _handleDuplicate();
                      }
                    : null,
                icon: const Icon(Icons.copy),
                label: const Text('Duplicate'),
              ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
            FilledButton.icon(
              onPressed: _openInNewWindow,
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('PDF'),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.secondary),
              ),
            ),
            FilledButton.icon(
              onPressed: _project.permissions.update
                  ? () {
                      AutoRouter.of(context).push(PapViewRoute(
                        uuid: _project.uuid,
                      ));
                    }
                  : null,
              icon: widget.project.readonly
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.edit),
              label: widget.project.readonly
                  ? const Text('View')
                  : const Text('Edit'),
            ),
          ],
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        "Office: ${_project.office?.acronym ?? 'NO OFFICE'}",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        "Description: ${_project.description ?? 'No description'}",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        'PIPOL Code: ${_project.pipolCode ?? 'N/A'}',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        'Total Cost: PHP ${NumberFormat('#,###', 'en_US').format(_project.totalCost)}',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                          "Contact Information: ${_project.contactInformation ?? 'NONE'}"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text("Notes: ${_project.notes ?? 'NO NOTES'}"),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                          "Updating Period: ${_project.updatingPeriod?.label ?? 'NOT INDICATED'}"),
                    ),
                  ),
                ],
              ),
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
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Theme.of(context).colorScheme.outline.withAlpha(100),
      ))),
      child: ListTile(
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
            _project.outdated
                ? Tooltip(
                    message:
                        '[READONLY MODE] \n\nThis PAP was submitted during ${_project.updatingPeriod?.label}. \nDuplicate to update and submit it this updating period.',
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        child: Icon(
                          Icons.visibility,
                          color: Theme.of(context).colorScheme.error,
                        )),
                  )
                : const CircleAvatar(
                    child: Icon(
                      Icons.edit,
                    ),
                  ),
          ],
        ),
        title: Text(
          _project.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _project.office?.acronym.toUpperCase() ?? 'OFFICE',
                  ),
                  const Text(
                    ' - ',
                  ),
                  Text(
                    _project.user?.fullname ?? 'NA',
                  ),
                  const Spacer(),
                  if (_project.notes != null)
                    Tooltip(
                      message: _project.notes,
                      child: const Icon(Icons.note_outlined),
                    ),
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
      ),
    );
  }
}
