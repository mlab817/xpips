import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  factory Meta({
    @JsonKey(name: "pagination") required Pagination pagination,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
