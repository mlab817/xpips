import 'package:freezed_annotation/freezed_annotation.dart';

part 'userquickresource.freezed.dart';
part 'userquickresource.g.dart';

@freezed
class UserQuickResource with _$UserQuickResource {
  factory UserQuickResource({
    required int id,
    required String fullname,
    @JsonKey(name: "image_url") String? imageUrl,
  }) = _UserQuickResource;

  factory UserQuickResource.fromJson(Map<String, dynamic> json) =>
      _$UserQuickResourceFromJson(json);

  static UserQuickResource initial() {
    return UserQuickResource(id: 1, fullname: '');
  }
}
