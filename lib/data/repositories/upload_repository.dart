import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:pips/data/network/dio.dart';
import 'package:pips/data/responses/upload_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/config.dart';
import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';

part 'upload_repository.g.dart';

abstract class UploadRepository {
  Future<UploadResponse?> upload(PlatformFile file);
}

class UploadRepositoryImplementer implements UploadRepository {
  final AppServiceClient client;
  final Dio dio;
  final String baseUrl;

  UploadRepositoryImplementer({
    required this.client,
    required this.dio,
    required this.baseUrl,
  });

  @override
  Future<UploadResponse?> upload(PlatformFile file, {String? fileName}) async {
    if (kIsWeb) {
      FormData formData = FormData();

      if (file.bytes != null) {
        final multipartFile = MultipartFile.fromBytes(file.bytes!.toList(),
            filename: fileName ?? 'Authorization Form.pdf');
        MapEntry<String, MultipartFile> fileEntry =
        MapEntry('file', multipartFile);
        // implement Dio upload
        formData.files.add(fileEntry);

        return dio
            .post("$baseUrl/upload", data: formData)
            .then((response) => UploadResponse.fromJson(response.data));
      }
    } else {
      // path is not null on
      if (file.path != null) {
        return client.upload(file: File(file.path!));
      }
    }


    // TODO: review progress implementation
    //     onSendProgress: (int sent, int total) {
    //   streamController.add(((sent / total) * 100).round());
    // }).then((Response response) async {
    //   // handle response
    //   final data = UploadResponse.fromJson(response.data);

    //   print('then is executed with data: $data');
    //   print(data.path);

    //   return data;
    // }).whenComplete(() => streamController.close());
  }
}

@Riverpod(keepAlive: true)
UploadRepository uploadRepository(UploadRepositoryRef ref) =>
    UploadRepositoryImplementer(
      client: ref.watch(appServiceClientProvider),
      dio: ref.watch(dioProvider),
      baseUrl: ref
          .watch(configProvider)
          .baseApiUrl,
    );
