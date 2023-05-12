import 'package:pips/data/requests/pagination_request.dart';

import '../../domain/models/notifications.dart';
import '../data_sources/app_service_client.dart';
import '../responses/notifications_response.dart';

abstract class NotificationsRepository {
  Future<NotificationsResponse> getAll(PaginationRequest input);

  Future<Notification> markNotificationAsRead(String id);
}

class NotificationsRepositoryImplementer implements NotificationsRepository {
  final AppServiceClient client;

  NotificationsRepositoryImplementer(this.client);

  @override
  Future<NotificationsResponse> getAll(PaginationRequest input) async {
    return await client.listNotifications(input);
  }

  @override
  Future<Notification> markNotificationAsRead(String id) async {
    return await client.markNotificationAsRead(id);
  }
}
