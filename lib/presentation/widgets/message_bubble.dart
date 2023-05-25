import 'package:flutter/material.dart';

import '../../domain/models/models.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
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
    return SizeTransition(
      sizeFactor: _animation,
      child: ListTile(
        title: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                widget.comment.comment,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
