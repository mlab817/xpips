import 'dart:async';

import 'package:pips/data/requests/pagination_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/notifications_repository.dart';
import '../../data/requests/notifications_request.dart';
import '../../data/responses/notifications_response.dart';
import '../../domain/models/notifications.dart';

part 'notifications_controller.g.dart';

@riverpod
class NotificationsRequestController extends _$NotificationsRequestController {
  @override
  NotificationsRequest build() => NotificationsRequest(perPage: 25, page: 1);

  void update({
    int? perPage,
    int? page,
    String? q,
  }) {
    state = state.copyWith(
      page: page ?? state.page,
      perPage: perPage ?? state.perPage,
      q: q ?? state.q,
    );
  }
}

@Riverpod(keepAlive: true)
Future<NotificationsResponse> notifications(NotificationsRef ref) {
  return ref
      .read(notificationsRepositoryProvider)
      .getAll(ref.watch(paginationRequestControllerProvider));
}

@riverpod
Future<Notifications> markAsRead(MarkAsReadRef ref,
    {required Notifications notification}) {
  final notificationsRepository = ref.read(notificationsRepositoryProvider);

  final response =
      notificationsRepository.markNotificationAsRead(notification.id);

  return response;
}
