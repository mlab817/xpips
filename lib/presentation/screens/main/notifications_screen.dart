import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/empty.dart';
import 'package:universal_io/io.dart';

import '../../../../application/functions.dart';
import '../../../../data/responses/notifications_response.dart';
import '../../../../presentation/controllers/notifications_controller.dart';
import '../../../../presentation/widgets/loading_dialog.dart';
import '../../resources/strings_manager.dart';

enum NotificationStatus {
  all,
  read,
  unread,
}

@RoutePage()
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  NotificationStatus _selected = NotificationStatus.all;

  @override
  Widget build(BuildContext context) {
    final valueAsync = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.notifications),
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          if (Platform.isAndroid) _buildRefreshButton(),
          if (Platform.isAndroid)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: _NotificationsSearchDelegate());
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              _buildPaginationControls(),
              valueAsync.when(
                data: (data) {
                  if (valueAsync.isRefreshing) {
                    return const LoadingOverlay();
                  }

                  if (data.data.isEmpty) {
                    return const Empty();
                  }

                  return _buildList(data, ref);
                },
                error: (error, stackTrace) => _buildError(error),
                loading: () =>
                    const Expanded(child: Center(child: LoadingOverlay())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationControls() {
    final currentPage =
        ref.watch(notificationsProvider).value?.meta.pagination.current ?? 1;
    final lastPage =
        ref.watch(notificationsProvider).value?.meta.pagination.last ?? 1;

    return Row(
      children: [
        if (!Platform.isAndroid) _buildRefreshButton(),
        if (!Platform.isAndroid) _buildSearch(),
        const Spacer(),
        if (!Platform.isAndroid) _buildStatusSwitcher(),
        IconButton(
            onPressed: currentPage == 1
                ? null
                : () {
                    ref
                        .read(notificationsRequestControllerProvider.notifier)
                        .previousPage();
                  },
            icon: const Icon(Icons.chevron_left)),
        Text('$currentPage/$lastPage'),
        IconButton(
            onPressed: currentPage == lastPage
                ? null
                : () {
                    ref
                        .read(notificationsRequestControllerProvider.notifier)
                        .nextPage();
                  },
            icon: const Icon(Icons.chevron_right)),
      ],
    );
  }

  Widget _buildSearch() {
    return Expanded(
      child: TextField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Type and press enter to search',
          fillColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        onSubmitted: (String value) {
          ref
              .read(notificationsRequestControllerProvider.notifier)
              .update(q: value);
        },
      ),
    );
  }

  Widget _buildRefreshButton() {
    return IconButton(
      onPressed: () {
        ref.invalidate(notificationsProvider);
      },
      icon: const Icon(
        Icons.refresh,
      ),
      tooltip: 'Reload page',
    );
  }

  Widget _buildStatusSwitcher() {
    return SegmentedButton<NotificationStatus>(
      selected: {_selected},
      segments: const <ButtonSegment<NotificationStatus>>[
        ButtonSegment(
          value: NotificationStatus.all,
          label: Text('ALL'),
        ),
        ButtonSegment(
          value: NotificationStatus.unread,
          label: Text('UNREAD'),
        ),
        ButtonSegment(
          value: NotificationStatus.read,
          label: Text('READ'),
        ),
      ],
      onSelectionChanged: (Set<NotificationStatus> newSelection) {
        var filter = '';

        switch (newSelection.first) {
          case NotificationStatus.all:
            filter = 'all';
          case NotificationStatus.unread:
            filter = 'unread';
          case NotificationStatus.read:
            filter = 'read';
          default:
            filter = 'all';
        }

        ref
            .read(notificationsRequestControllerProvider.notifier)
            .update(filter: filter);
        setState(() {
          _selected = newSelection.first;
        });
      },
    );
  }

  Widget _buildList(NotificationsResponse data, WidgetRef ref) {
    final notifications = data.data;

    return Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return ListTile(
            leading: notification.readAt != null
                ? const Icon(Icons.mark_email_read)
                : const Icon(Icons.mark_email_unread),
            title: Text(notification.data.sender),
            subtitle: Text(
              notification.data.message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(formatDate(notification.createdAt)),
            onTap: () => _confirmMarkAsRead(notification, context),
          );
        },
      ),
    );
  }

  Widget _buildError(error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error!', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(
            height: 30,
          ),
          Text(error.toString()),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<void> _confirmMarkAsRead(notification, BuildContext context) async {
    final response = await showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.mark_email_unread,
            size: 36,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                notification.data.subject,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(notification.data.message),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(AppStrings.close),
            ),
            if (notification.readAt == null)
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(AppStrings.markAsRead),
              ),
          ],
        );
      },
    );

    if (response == true) {
      if (context.mounted) {
        _handleRead(notification, context);
      }
    }
  }

  Future<void> _handleRead(notification, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const LoadingOverlay();
        });

    // handle mark as read
    try {
      ref.read(markAsReadProvider(notification: notification));

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Success!')));

        ref.invalidate(notificationsProvider);
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));

      // show dialog again
      _confirmMarkAsRead(notification, context);
    } finally {
      // pop mark as read dialog
      Navigator.of(context).pop();
    }
  }
}

// TODO: Implement search delegate for mobile
class _NotificationsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
