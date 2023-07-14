import 'package:pips/application/extensions.dart';
import 'package:pips/data/repositories/repositories.dart';
import 'package:pips/presentation/controllers/controllers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/responses/createproject_response.dart';

part 'postproject_controller.g.dart';

@riverpod
class PostProjectController extends _$PostProjectController {
  Future<CreateProjectResponse> submit() async {
    final repository = ref.watch(projectRepositoryProvider);
    final payload = ref.watch(simpleProjectProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => repository.post(payload.toRequest()));

    return await repository.post(payload.toRequest());
  }

  @override
  FutureOr<CreateProjectResponse> build() =>
      submit(); //Future.value(state.value);
}
