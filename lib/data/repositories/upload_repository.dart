import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pips/data/network/dio.dart';
import 'package:pips/data/responses/upload_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/config.dart';
import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';

part 'upload_repository.g.dart';

abstract class UploadRepository {
  Future<UploadResponse> upload(File file);

  Future<UploadResponse> webUpload(Uint8List file);
}

class UploadRepositoryImplementer implements UploadRepository {
  final AppServiceClient client;
  final Dio dio;

  UploadRepositoryImplementer({
    required this.client,
    required this.dio,
  });

  @override
  Future<UploadResponse> upload(File file, {String? fileName}) async {
    return client.upload(file: file);
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

  @override
  Future<UploadResponse> webUpload(Uint8List file, {String? fileName}) async {
    print('kIsWeb upload repo triggered');
    FormData formData = FormData();

    final multipartFile = MultipartFile.fromBytes(file,
        filename: fileName ?? 'Authorization Form.pdf');
    MapEntry<String, MultipartFile> fileEntry = MapEntry('file', multipartFile);
    // implement Dio upload
    formData.files.add(fileEntry);

    return dio
        .post("${Config.baseApiUrl}/upload", data: formData)
        .then((response) => UploadResponse.fromJson(response.data));
  }
}

@Riverpod(keepAlive: true)
UploadRepository uploadRepository(UploadRepositoryRef ref) =>
    UploadRepositoryImplementer(
        client: ref.watch(appServiceClientProvider),
        dio: ref.watch(dioProvider));
