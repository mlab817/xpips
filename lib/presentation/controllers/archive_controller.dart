import 'package:pips/data/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/requests/requests.dart';
import '../../data/responses/responses.dart';

part 'archive_controller.g.dart';

@Riverpod(keepAlive: true)
class ArchiveRequestController extends _$ArchiveRequestController {
  @override
  ArchiveRequest build() => ArchiveRequest(perPage: 25, page: 1);

  void update({
    int? perPage,
    int? page,
    String? q,
  }) {
    state = state.copyWith(
      perPage: perPage ?? state.perPage,
      page: page ?? state.page,
      q: q ?? state.q,
    );
  }

  void nextPage() {
    state = state.copyWith(page: state.page + 1);
  }

  void previousPage() {
    state = state.copyWith(page: state.page - 1);
  }

  void search(String? q) {
    state = state.copyWith(q: q);
  }

  void clearSearch() {
    state = state.copyWith(q: null);
  }
}

@Riverpod(keepAlive: true)
Future<ProjectsResponse> archiveController(ArchiveControllerRef ref) async {
  final repository = ref.watch(projectRepositoryProvider);
  final request = ref.watch(archiveRequestControllerProvider);

  return await repository.getArchived(request);
}
