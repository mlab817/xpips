import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/app_router.dart';
import '../controllers/viewpap_controller.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/papform.dart';

@RoutePage()
class PapEditScreen extends ConsumerStatefulWidget {
  const PapEditScreen({super.key, @PathParam('uuid') required this.uuid});

  final String uuid;

  @override
  ConsumerState<PapEditScreen> createState() => _PapEditScreenState();
}

class _PapEditScreenState extends ConsumerState<PapEditScreen> {
  @override
  Widget build(BuildContext context) {
    final projectAsync = ref.watch(projectProvider(uuid: widget.uuid));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).push(const HomeRoute());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Edit PAP'),
      ),
      body: projectAsync.when(
        data: (data) {
          return PapForm(
            uuid: widget.uuid,
          );
        },
        error: (error, stacktrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const LoadingOverlay(),
      ),
    );
  }
}
