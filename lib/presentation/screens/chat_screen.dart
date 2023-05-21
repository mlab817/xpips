import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/responses/projects_response.dart';
import 'package:pips/presentation/controllers/chats_controller.dart';
import 'package:pips/presentation/controllers/viewpap_controller.dart';

import '../../../application/app_router.dart';
import '../../../presentation/widgets/loading_dialog.dart';
import '../../../presentation/widgets/logout_button.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final chatsAsync = ref.watch(chatMessagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: chatsAsync.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildList(data),
          );
        },
        error: (error, stackTrace) {
          return _buildError(error);
        },
        loading: () {
          return const LoadingOverlay();
        },
      ),
    );
  }

  Widget _buildList(ProjectsResponse data) {
    final projects = data.data;

    return ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];

          return ListTile(
            title: Text(project.title),
            subtitle: const Text('Last Comment'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ref.read(selectedProjectProvider.notifier).update(project);

              AutoRouter.of(context).push(const PapViewRoute());
            },
          );
        });
  }

  Widget _buildError(error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Error',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(error.toString()),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // reload chat rooms
              ref.read(chatsControllerProvider.notifier).get();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
