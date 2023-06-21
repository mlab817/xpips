import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';
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
    final rawUrl = "${ref.watch(configProvider).generatePdfBaseUrl}/${uuid}";
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

  @override
  Widget build(BuildContext context) {
    final archiveAsync = ref.watch(archiveControllerProvider);
    final currentPage = archiveAsync.value?.meta.pagination.current;
    final lastPage = archiveAsync.value?.meta.pagination.last;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
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
      body: Column(
        children: [
          // top menu
          Row(
            children: [
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
                  if (archiveAsync.isRefreshing) return const LoadingOverlay();

                  if (data.data.isEmpty) {
                    return const Center(
                      child: Text('NO PROJECTS'),
                    );
                  }

                  return ListView.builder(
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      final project = data.data[index];

                      return ListTile(
                        leading: const Icon(Icons.picture_as_pdf),
                        title: Text(
                            '${project.office?.acronym} - ${project.title}'),
                        subtitle: Text(
                            'Submitted for ${project.updatingPeriod?.label}'),
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
                  return Container();
                },
                loading: () => const LoadingOverlay()),
          ),
        ],
      ),
    );
  }
}
