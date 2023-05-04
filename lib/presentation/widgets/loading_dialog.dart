import 'package:flutter/material.dart';

// display a full-screen loading indicator over the current screen
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Center(
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
              ),
              CircularProgressIndicator(
                color: Colors.yellow[700],
              ),
              ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  width: 25,
                  height: 25,
                ),
              ),
            ]),
          ),
        ),
        onWillPop: () async => false);
  }
}
