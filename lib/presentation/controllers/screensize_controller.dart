import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenWidthProvider =
    ProviderFamily<double, BuildContext>((ref, context) {
  return MediaQuery.of(context).size.width;
});
