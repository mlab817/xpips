import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpips/application/providers/notifications_provider.dart';
import 'package:xpips/data/requests/notifications_request.dart';
import 'package:xpips/data/responses/notifications_response.dart';
import 'package:xpips/domain/models/notifications.dart';

class NotificationController extends AsyncNotifier<NotificationsResponse> {
  late NotificationsRequest notificationsRequest;
  int currentPage = 1;
  String? q;

  void nextPage() {
    print('nextPage ran');
    currentPage++;
    getAll();
  }

  void search(String query) {
    print('nextPage ran');
    currentPage = 1;
    q = query;
    getAll();
  }

  Future<NotificationsResponse> getAll() async {
    // set the loading state
    state = const AsyncLoading();

    print("getAll ran");

    // read repository using ref
    final notificationsRepository = ref.read(notificationsRepositoryProvider);

    final response = notificationsRepository
        .getAll(notificationsRequest.copyWith(page: currentPage, q: q));

    // retrieve notifications
    state = await AsyncValue.guard(() => response);

    return response;
  }

  Future<Notification> markAsRead(Notification notification) {
    final notificationsRepository = ref.read(notificationsRepositoryProvider);

    final response =
    notificationsRepository.markNotificationAsRead(notification.id);

    return response;
  }

  @override
  FutureOr<NotificationsResponse> build() {
    // initialize currentPage at 1
    currentPage = 1;

    // initialize search as null
    q = null;

    notificationsRequest =
        NotificationsRequest(perPage: 25, page: currentPage, q: q);

    return getAll();
  }
}

final notificationsControllerProvider =
AsyncNotifierProvider<NotificationController, NotificationsResponse>(() {
  return NotificationController();
});
