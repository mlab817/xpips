import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/presentation/widgets/empty.dart';

import '../../../../application/providers/dateformatter_provider.dart';
import '../../../../domain/entities/models.dart';
import '../../../../data/responses/responses.dart';
import '../../../../presentation/controllers/controllers.dart';
import '../../../../presentation/widgets/loading_dialog.dart';
import '../../../application/app_router.dart';

@RoutePage()
class CommentsScreen extends ConsumerStatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CommentsScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    final chatsAsync = ref.watch(chatRoomsProvider);

    final currentPage = chatsAsync.value?.meta.pagination.current ?? 1;
    final lastPage = chatsAsync.value?.meta.pagination.last ?? 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('COMMENTS'),
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  tooltip: 'Reload data',
                  onPressed: () {
                    ref.invalidate(chatRoomsProvider);
                  },
                  icon: const Icon(Icons.refresh),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      fillColor: Colors.transparent,
                      filled: false,
                      hintText: 'Type and press enter to search',
                    ),
                    onSubmitted: (String? value) {
                      if (value == null || value.isEmpty) return;

                      //
                      ref
                          .read(chatsRequestControllerProvider.notifier)
                          .updateQuery(value);
                    },
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: currentPage > 1
                        ? () {
                            ref
                                .read(chatsRequestControllerProvider.notifier)
                                .previousPage();
                          }
                        : null,
                    icon: const Icon(Icons.chevron_left)),
                Text('$currentPage/$lastPage'),
                IconButton(
                    onPressed: currentPage < lastPage
                        ? () {
                            ref
                                .read(chatsRequestControllerProvider.notifier)
                                .nextPage();
                          }
                        : null,
                    icon: const Icon(Icons.chevron_right)),
              ],
            ),
            Expanded(
              child: chatsAsync.when(
                data: (data) {
                  if (data.data.isEmpty) {
                    return const Empty();
                  }

                  return _buildList(data);
                },
                error: (error, stackTrace) {
                  return _buildError(error);
                },
                loading: () {
                  return const LoadingOverlay();
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildList(ChatRoomsResponse data) {
    final chats = data.data;

    if (chats.isEmpty) {
      return const Center(
        child: Text('NO COMMENTS'),
      );
    }

    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final ChatRoom chat = chats[index];
          final comment = chat.lastComment != null
              ? chat.lastComment!.comment
              : 'NO COMMENT';

          return ListTile(
            title: Text(chat.title),
            subtitle: Text(
              comment,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black54),
            ),
            trailing: chat.lastComment != null
                ? Text(ref
                    .watch(dateFormatterProvider)
                    .format(chat.lastComment!.createdAt))
                : null,
            onTap: () {
              // ref.read(selectedProjectProvider.notifier).update(project);

              AutoRouter.of(context)
                  .push(ProjectCommentsRoute(uuid: chat.uuid));
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
          FilledButton(
            onPressed: () {
              // reload chat rooms
              ref.invalidate(chatRoomsProvider);
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
