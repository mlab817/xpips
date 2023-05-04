import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/functions.dart';
import '../../data/responses/notifications_response.dart';
import '../../presentation/controllers/notifications_controller.dart';
import '../../presentation/widgets/loading_dialog.dart';
import '../../presentation/widgets/logout_button.dart';

@RoutePage()
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final valueAsync = ref.watch(notificationsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showSearch(
                context: context, delegate: _NotificationsSearchDelegate());
          },
          icon: const Icon(Icons.search),
        ),
        title: const Text('Notifications'),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: valueAsync.when(
        data: (data) => _buildList(data, ref),
        error: (error, stackTrace) => Center(
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
        ),
        loading: () => const LoadingOverlay(),
      ),
    );
  }

  Widget _buildList(NotificationsResponse data, WidgetRef ref) {
    final notifications = data.data;

    return ListView.builder(
      itemCount: notifications.length + 1,
      itemBuilder: (context, index) {
        if (index == notifications.length) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  // load next
                  ref.read(notificationsControllerProvider.notifier).nextPage();
                },
                child: const Text('Load More')),
          );
        }

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
          content: Text(notification.data.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            if (notification.readAt == null)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Mark as Read'),
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
      final response = await ref
          .read(notificationsControllerProvider.notifier)
          .markAsRead(notification);

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Success!')));
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

// TODO: implement search
class _NotificationsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return ListTile(title: Text(query));
  }
}
