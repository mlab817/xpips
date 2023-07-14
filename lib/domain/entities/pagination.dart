import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  factory Pagination({
    @JsonKey(name: "total") required int total,
    @JsonKey(name: "pageSize") required int pageSize,
    @JsonKey(name: "current") required int current,
    @JsonKey(name: "last") required int last,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
