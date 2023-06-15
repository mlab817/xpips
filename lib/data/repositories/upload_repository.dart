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
import '../../domain/models/option.dart';
import '../data_sources/app_service_client.dart';
import '../responses/uploadattachment_response.dart';

part 'upload_repository.g.dart';

abstract class UploadRepository {
  Future<UploadResponse?> upload(PlatformFile file);

  Future<UploadAttachmentResponse> attach(
      String uuid, PlatformFile attachment, Option attachmentType);
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
  Future<UploadResponse> upload(PlatformFile file, {String? fileName}) async {
    // if both data are empty
    if (file.bytes == null && file.path == null) throw Error();

    if (kIsWeb) {
      FormData formData = FormData();

      final multipartFile = MultipartFile.fromBytes(file.bytes!.toList(),
          filename: fileName ?? 'Authorization Form.pdf');
      MapEntry<String, MultipartFile> fileEntry =
          MapEntry('file', multipartFile);
      // implement Dio upload
      formData.files.add(fileEntry);

      return dio
          .post("$baseUrl/upload", data: formData)
          .then((response) => UploadResponse.fromJson(response.data));
    } else {
      // if app is not web
      return client.upload(file: File(file.path!));
    }
  }

  @override
  Future<UploadAttachmentResponse> attach(
      String uuid, PlatformFile attachment, Option attachmentType) async {
    if (attachment.bytes == null && attachment.path == null) throw Error();

    if (kIsWeb) {
      FormData formData = FormData();

      final multipartFile = MultipartFile.fromBytes(attachment.bytes!.toList(),
          filename: attachment.name);
      MapEntry<String, MultipartFile> fileEntry =
          MapEntry('file', multipartFile);
      // implement Dio upload
      formData.files.add(fileEntry);
      formData.fields.add(
        MapEntry(
          'attachment_type_id',
          attachmentType.value.toString(),
        ),
      );

      return dio
          .post("$baseUrl/projects/$uuid/attachments", data: formData)
          .then((response) => UploadAttachmentResponse.fromJson(response.data));
    } else {
      // if app is not web
      return client.attach(
        uuid,
        attachment: File(attachment.path!),
        attachmentTypeId: attachmentType.value,
      );
    }
  }
}

@Riverpod(keepAlive: true)
UploadRepository uploadRepository(UploadRepositoryRef ref) =>
    UploadRepositoryImplementer(
      client: ref.watch(appServiceClientProvider),
      dio: ref.watch(dioProvider),
      baseUrl: ref.watch(configProvider).baseApiUrl,
    );
