import 'package:flutter/material.dart';

class MyFadeIn extends StatefulWidget {
  final Widget child;
  const MyFadeIn({required this.child,Key? key}) : super(key: key);

  @override
  _MyFadeInState createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
  late final Animation<double> _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(opacity: _animation,child: widget.child,);
  }
}