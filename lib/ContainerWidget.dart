import 'package:animation_app/my_fade_in.dart';
import 'package:flutter/material.dart';

class DrawContainer extends StatelessWidget {
  const DrawContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyFadeIn(
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            boxShadow: const [
              BoxShadow(
                color: Colors.deepPurple,
                spreadRadius: 1,
                blurRadius: 11,
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(55.0),
              topRight: Radius.circular(14.0),
              bottomLeft: Radius.circular(14.0),
              bottomRight: Radius.circular(55.0),
            ),
            border: Border.all(color: Colors.deepPurple)
        ),
      ),
    );
  }
}
