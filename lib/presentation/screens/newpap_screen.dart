import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/papform_screen.dart';

import '../../data/requests/fullproject_request.dart';
import '../controllers/fullproject_controller.dart';

@RoutePage()
class NewPapScreen extends ConsumerStatefulWidget {
  const NewPapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPapScreenState();
}

class _NewPapScreenState extends ConsumerState<NewPapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('New Program/Project'),
          actions: [
            FilledButton(
              onPressed: () async {
                // TODO: handle submit
                FullProjectRequest projectToSubmit =
                    FullProjectRequest.fromFullProject(
                        ref.watch(fullProjectControllerProvider));

                debugPrint(projectToSubmit.toJson().toString());

                // TODO: handle form submission
              },
              child: const Text('Save'),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: const Expanded(
          child: PapForm(),
        ));
  }
}
