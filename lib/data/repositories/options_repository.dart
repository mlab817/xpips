import 'package:hive_flutter/hive_flutter.dart';
import 'package:pips/application/providers/hivebox_provider.dart';
import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../responses/options_response.dart';

part 'options_repository.g.dart';

abstract class OptionsRepository {
  Future<OptionsResponse> get();
}

class OptionsRepositoryImplementer implements OptionsRepository {
  final AppServiceClient client;
  // final Box box;

  OptionsRepositoryImplementer({
    required this.client,
    // required this.box,
  });

  @override
  Future<OptionsResponse> get() async {
    return await client.getOptions();
    // if (box.isEmpty) {
    //   final OptionsResponse response = await client.getOptions();

    //   box.add(response);

    //   return response;
    // } else {
    //   final List<OptionsResponse> values =
    //       box.values.cast<OptionsResponse>().toList();

    //   return Future.value(values.first);
    // }
  }
}

@Riverpod(keepAlive: true)
OptionsRepository optionsRepository(OptionsRepositoryRef ref) =>
    OptionsRepositoryImplementer(
      // box: ref.watch(hiveBoxProvider),
      client: ref.watch(appServiceClientProvider),
    );
