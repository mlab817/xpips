import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/network.dart';
import '../../data/repositories/notifications_repository.dart';

final notificationsRepositoryProvider =
    Provider<NotificationsRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return NotificationsRepositoryImplementer(client);
});
