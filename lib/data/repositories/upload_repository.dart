import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dio_provider.dart';
import 'package:pips/data/requests/upload_request.dart';
import 'package:pips/data/responses/upload_response.dart';

abstract class UploadRepository {
  Future<UploadResponse> upload(UploadRequest request);
}

class UploadRepositoryImplementer implements UploadRepository {
  final Dio dio;
  final StreamController<int> streamController;

  UploadRepositoryImplementer({
    required this.dio,
    required this.streamController,
  });

  @override
  Future<UploadResponse> upload(UploadRequest request) async {
    print('upload repository is executed');
    FormData formData = FormData();
    final file = MultipartFile.fromBytes(request.file,
        filename: 'Authorization Form.pdf');
    MapEntry<String, MultipartFile> fileEntry = MapEntry('file', file);
    // implement Dio upload
    formData.files.add(fileEntry);

    return dio.post('https://api.pips.da.gov.ph/upload', data: formData,
        onSendProgress: (int sent, int total) {
      streamController.add(((sent / total) * 100).round());
    }).then((Response response) async {
      // handle response
      final data = UploadResponse.fromJson(response.data);

      print('then is executed with data: $data');
      print(data.path);

      return data;
    }).whenComplete(() => streamController.close());
  }
}

final uploadStreamControllerProvider =
    Provider<StreamController<int>>((ref) => StreamController<int>());

final uploadRepositoryProvider = Provider<UploadRepository>((ref) {
  final streamController = ref.watch(uploadStreamControllerProvider);

  return UploadRepositoryImplementer(
      dio: ref.watch(dioProvider), streamController: streamController);
});

class FileUploadController extends AsyncNotifier<UploadResponse?> {
  Future<UploadResponse?> upload(UploadRequest request) async {
    final repository = ref.watch(uploadRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.upload(request));
    return null;
  }

  @override
  FutureOr<UploadResponse?> build() async => null;
}

final fileUploadControllerProvider =
    AsyncNotifierProvider<FileUploadController, UploadResponse?>(() {
  return FileUploadController();
});
