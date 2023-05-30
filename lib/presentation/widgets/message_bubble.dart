import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/dateformatter_provider.dart';
import 'package:pips/presentation/controllers/currentuser_controller.dart';

import '../../domain/models/models.dart';

class MessageBubble extends ConsumerStatefulWidget {
  const MessageBubble({Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  ConsumerState<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends ConsumerState<MessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // _animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse();
    //   }
    // });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = ref.watch(currentUserProvider)?.id;
    final comment = widget.comment;

    // if the user added the comment, display on the right
    if (comment.userId == currentUserId) {
      return ListTile(
        title: Row(
          children: [
            Text(
              ref.watch(dateFormatterProvider).format(widget.comment.createdAt),
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            Container(
              width: 180,
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                widget.comment.comment,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // default: display on the left
    return SizeTransition(
      sizeFactor: _animation,
      child: ListTile(
        title: Row(
          children: [
            Tooltip(
              message: widget.comment.user?.fullname,
              child: const Icon(Icons.person),
            ),
            const SizedBox(width: 8),
            Container(
              width: 180,
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                widget.comment.comment,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Text(
              ref.watch(dateFormatterProvider).format(widget.comment.createdAt),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
