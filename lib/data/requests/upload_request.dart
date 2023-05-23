import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_request.freezed.dart';

part 'upload_request.g.dart';

@freezed
class UploadRequest with _$UploadRequest {
  factory UploadRequest({
    required List<int> file,
  }) = _UploadRequest;

  factory UploadRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadRequestFromJson(json);

  // toJson
  @override
  Map<String, dynamic> toJson() {
    FormData formData = FormData.fromMap(
        {'file': MultipartFile.fromBytes(file, filename: 'File')});

    Map<String, dynamic> map = <String, dynamic>{};

    for (var field in formData.fields) {
      map[field.key] = field.value;
    }

    return map;
  }
}
