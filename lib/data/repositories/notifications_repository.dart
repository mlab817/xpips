import '../../data/data_sources/network.dart';
import '../../domain/models/notifications.dart';
import '../requests/notifications_request.dart';
import '../responses/notifications_response.dart';

abstract class NotificationsRepository {
  Future<NotificationsResponse> getAll(NotificationsRequest input);

  Future<Notification> markNotificationAsRead(String id);
}

class NotificationsRepositoryImplementer implements NotificationsRepository {
  final AppServiceClient client;

  NotificationsRepositoryImplementer(this.client);

  @override
  Future<NotificationsResponse> getAll(NotificationsRequest input) async {
    return await client.listNotifications(input);
  }

  @override
  Future<Notification> markNotificationAsRead(String id) async {
    return await client.markNotificationAsRead(id);
  }
}
