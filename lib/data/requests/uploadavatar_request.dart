import 'package:dio/dio.dart';

class UploadAvatarRequest {
  final List<int> rawBytes;

  UploadAvatarRequest(this.rawBytes);

  Map<String, dynamic> toJson() {
    FormData formData = FormData();

    final file =
        MultipartFile.fromBytes(rawBytes, filename: 'Authorization Form.pdf');

    MapEntry<String, MultipartFile> fileEntry = MapEntry('file', file);

    // implement Dio upload
    formData.files.add(fileEntry);

    var map = <String, dynamic>{};

    for (var file in formData.files) {
      map[file.key] = file;
    }

    return map;
  }
}
