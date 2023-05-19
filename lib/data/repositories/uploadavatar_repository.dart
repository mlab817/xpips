import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/data_sources/app_service_client.dart';

abstract class UploadAvatarRepository {
  Future<void> uploadAvatar(File request);
}

class UploadAvatarRepositoryImplementer implements UploadAvatarRepository {
  final AppServiceClient client;

  UploadAvatarRepositoryImplementer({required this.client});

  @override
  Future<void> uploadAvatar(File request) async {
    return client.uploadAvatar(request);
  }
}

final uploadAvatarRepositoryProvider = Provider<UploadAvatarRepository>((ref) {
  final client = ref.watch(appServiceClientProvider);

  return UploadAvatarRepositoryImplementer(client: client);
});
