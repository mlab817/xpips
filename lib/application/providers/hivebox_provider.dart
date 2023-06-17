import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/form_options.dart';

part 'hivebox_provider.g.dart';

@Riverpod(keepAlive: true)
Box<FormOptions> hiveBox(HiveBoxRef ref) =>
    Hive.box<FormOptions>('form_options');
