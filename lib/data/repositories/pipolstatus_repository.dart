import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../data_sources/app_service_client.dart';

part 'pipolstatus_repository.freezed.dart';
part 'pipolstatus_repository.g.dart';

@freezed
class PipolStatus with _$PipolStatus {
  factory PipolStatus({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'projects_count') required int projectsCount,
  }) = _PipolStatus;

  factory PipolStatus.fromJson(Map<String, dynamic> json) =>
      _$PipolStatusFromJson(json);
}

@freezed
class PipolStatusResponse with _$PipolStatusResponse {
  factory PipolStatusResponse({
    required List<PipolStatus> data,
  }) = _PipolStatusResponse;

  factory PipolStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$PipolStatusResponseFromJson(json);
}

abstract class PipolStatusRepository {
  Future<PipolStatusResponse> getPipolStatuses();
}

class PipolStatusRepositoryImplementer implements PipolStatusRepository {
  final AppServiceClient client;

  PipolStatusRepositoryImplementer({
    required this.client,
  });

  @override
  Future<PipolStatusResponse> getPipolStatuses() async {
    return client.getPipolStatuses();
  }
}

@Riverpod(keepAlive: true)
PipolStatusRepository pipolStatusRepository(PipolStatusRepositoryRef ref) =>
    PipolStatusRepositoryImplementer(
        client: ref.watch(appServiceClientProvider));
