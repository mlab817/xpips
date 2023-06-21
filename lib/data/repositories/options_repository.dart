import 'package:hive_flutter/hive_flutter.dart';
import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:pips/domain/models/form_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../responses/options_response.dart';

part 'options_repository.g.dart';

abstract class OptionsRepository {
  Future<FormOptions> get();
}

class OptionsRepositoryImplementer implements OptionsRepository {
  final AppServiceClient client;

  OptionsRepositoryImplementer({
    required this.client,
  });

  @override
  Future<FormOptions> get() async {
    final OptionsResponse optionsResponse = await client.getOptions();

    return optionsResponse.data;
    // print('opening box');

    // final box = await Hive.openBox<FormOptions>('form_options');

    // print('box $box');

    // final OptionsResponse optionsResponse = await client.getOptions();

    // print(optionsResponse.data);

    // // check first from hive if there is data,
    // // else retrieve from server first
    // if (box.isEmpty) {
    //   print('box is empty --- retrieving data from server');

    //   final OptionsResponse optionsResponse = await client.getOptions();

    //   box.put('form_options', optionsResponse.data);

    //   box.close();

    //   print(optionsResponse.data.agenda);

    //   return box.get('form_options') as FormOptions;
    // } else {
    //   print('box is not empty --- retrieving data from hive');

    //   final formOptions = box.get('form_options') as FormOptions;

    //   print('--- agenda --- ');
    //   print(formOptions.agenda);

    //   box.close();

    //   return formOptions;
    // }
  }
}

@Riverpod(keepAlive: true)
OptionsRepository optionsRepository(OptionsRepositoryRef ref) =>
    OptionsRepositoryImplementer(
      client: ref.watch(appServiceClientProvider),
    );
