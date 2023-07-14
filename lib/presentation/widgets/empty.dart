import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/empty.png',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Text('NOTHING HERE.'),
        ],
      ),
    );
  }
}
