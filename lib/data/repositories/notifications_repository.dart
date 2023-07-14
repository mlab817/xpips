import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/functions.dart';
import '../../application/providers/appserviceclient_provider.dart';
import '../../domain/entities/notifications.dart';
import '../data_sources/app_service_client.dart';
import '../requests/notifications_request.dart';
import '../responses/notifications_response.dart';

part 'notifications_repository.g.dart';

abstract class NotificationsRepository {
  /// Retrieve all notifications based on the provided `NotificationsRequest`
  Future<NotificationsResponse> getAll(NotificationsRequest input);

  /// Mark a notification as read based on given String `id`
  Future<Notifications> markNotificationAsRead(String id);
}

class NotificationsRepositoryImplementer implements NotificationsRepository {
  final AppServiceClient client;

  NotificationsRepositoryImplementer({required this.client});

  @override
  Future<NotificationsResponse> getAll(NotificationsRequest input) async {
    try {
      return await client.listNotifications(input);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<Notifications> markNotificationAsRead(String id) async {
    try {
      return await client.markNotificationAsRead(id);
    } catch (e) {
      throw formatError(e);
    }
  }
}

@Riverpod(keepAlive: true)
NotificationsRepository notificationsRepository(
        NotificationsRepositoryRef ref) =>
    NotificationsRepositoryImplementer(
        client: ref.watch(appServiceClientProvider));
