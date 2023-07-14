import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';
import 'package:pips/presentation/widgets/empty.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../application/config.dart';
import '../../controllers/archive_controller.dart';

@RoutePage()
class ArchiveScreen extends ConsumerStatefulWidget {
  const ArchiveScreen({super.key});

  @override
  ConsumerState<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends ConsumerState<ArchiveScreen> {
  Future<void> _openInNewWindow(String uuid) async {
    // confirm before opening page
    bool response = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm'),
            content: const Text(
                'This action will open your default browser and will load the PDF view of this PAP. Continue?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('CANCEL')),
              FilledButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('OPEN ANYWAY')),
            ],
          );
        });

    if (response) {
      final rawUrl = "${ref.watch(configProvider).generatePdfBaseUrl}/$uuid";
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
  }

  @override
  Widget build(BuildContext context) {
    final archiveAsync = ref.watch(archiveControllerProvider);
    final currentPage = archiveAsync.value?.meta.pagination.current ?? 1;
    final lastPage = archiveAsync.value?.meta.pagination.last ?? 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('HELP'),
                      content: const Text(
                          'Archive contains a list of Programs and Projects that were submitted in previous updating period(s) and have already been duplicated for updating for the current updating period.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('DISMISS'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.help_outline),
            tooltip: 'What is this?',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              // top menu
              Row(
                children: [
                  IconButton(
                    tooltip: 'Reload data',
                    onPressed: () {
                      ref.invalidate(archiveControllerProvider);
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: 'Type and press enter to search',
                      ),
                      onSubmitted: (String? value) {
                        ref
                            .read(archiveRequestControllerProvider.notifier)
                            .search(value);
                      },
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: currentPage == 1
                        ? null
                        : () {
                            ref
                                .read(archiveRequestControllerProvider.notifier)
                                .previousPage();
                          },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Text('$currentPage/$lastPage'),
                  IconButton(
                    onPressed: currentPage == lastPage
                        ? null
                        : () {
                            ref
                                .read(archiveRequestControllerProvider.notifier)
                                .nextPage();
                          },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              // content/list
              Expanded(
                child: archiveAsync.when(
                    data: (data) {
                      if (archiveAsync.isRefreshing) {
                        return const LoadingOverlay();
                      }

                      if (data.data.isEmpty) {
                        return const Empty();
                      }

                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          final project = data.data[index];

                          return ListTile(
                            leading: const Icon(Icons.picture_as_pdf),
                            title: Text(
                                '${project.office?.acronym} - ${project.title}'),
                            subtitle: Text(
                                'Submitted for ${project.updatingPeriod?.label} / View in web'),
                            trailing: Text(
                              ref
                                  .watch(dateFormatterProvider)
                                  .format(DateTime.parse(project.updatedAt)),
                            ),
                            onTap: () {
                              _openInNewWindow(project.uuid);
                            },
                          );
                        },
                      );
                    },
                    error: (error, _) {
                      return Center(
                        child: Column(children: [
                          Text(error.toString()),
                          const SizedBox(
                            height: 10,
                          ),
                          FilledButton(
                              onPressed: () {
                                ref.invalidate(archiveControllerProvider);
                              },
                              child: const Text('TRY AGAIN'))
                        ]),
                      );
                    },
                    loading: () => const LoadingOverlay()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
