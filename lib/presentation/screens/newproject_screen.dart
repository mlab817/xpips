import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/options_controller.dart';

@RoutePage()
class NewProjectScreen extends ConsumerStatefulWidget {
  const NewProjectScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends ConsumerState<NewProjectScreen> {
  @override
  Widget build(BuildContext context) {
    final optionsValue = ref.watch(optionsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Program or Project'),
      ),
      body: optionsValue.when(
        data: (data) {
          return Container();
        },
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
