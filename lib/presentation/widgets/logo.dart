import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 110,
        width: 125,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  width: 64,
                  height: 64,
                ),
              ),
            ),
            Image.asset(
              'assets/da.png',
              height: 80,
              width: 80,
            ),
          ],
        ),
      ),
    );
  }
}
