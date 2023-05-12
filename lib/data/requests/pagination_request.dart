import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_request.freezed.dart';
part 'pagination_request.g.dart';

@freezed
class PaginationRequest with _$PaginationRequest {
  factory PaginationRequest({
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "per_page") required int perPage,
    @JsonKey(name: "q") String? q,
  }) = _PaginationRequest;

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);
}

class PaginationRequestController extends Notifier<PaginationRequest> {
  void update({int? page, int? perPage, String? q}) {
    state = state.copyWith(
      page: page ?? state.page,
      perPage: perPage ?? state.perPage,
      q: q ?? state.q,
    );
  }

  @override
  PaginationRequest build() {
    return PaginationRequest(page: 1, perPage: 25);
  }
}

final paginationRequestControllerProvider =
    NotifierProvider<PaginationRequestController, PaginationRequest>(() {
  return PaginationRequestController();
});
