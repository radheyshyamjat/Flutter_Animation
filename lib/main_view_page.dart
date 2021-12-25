import 'dart:ui';

import 'package:animation_app/ContainerWidget.dart';
import 'package:animation_app/colors.dart';
import 'package:animation_app/enum.dart';
import 'package:animation_app/my_fade_in.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainViewPage extends StatefulWidget {
  const MainViewPage({Key? key}) : super(key: key);
  @override
  State<MainViewPage> createState() => MainViewPageState();
}


class MainViewPageState extends State<MainViewPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  int roundColor = 0;
  bool animateItemsFirstRound = true;
  bool showRoundSecondIcons = false;
  bool animateItemsSecondRound = true;

  final animationDuration = const Duration(milliseconds: 600);
  var count = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: animationDuration)
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          if (++count < 3) {
            await Future.delayed(const Duration(milliseconds: 400));
            setState(() {
              if(count==1) {
                showRoundSecondIcons=true;
              } else if(count==2) {
                animateItemsSecondRound=false;
              }
            });
            _controller.forward(from: 0.0);
          }
        }
      });

    startCircle();
    getColor();
  }

  // Circle color scheme animation
  Future<void> startCircle() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _controller.forward(from: 0.0); // it starts the animation;
    animateItemsFirstRound=false;
  }

  // Circle decoration color
  getColor()async{
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      if(!(++roundColor==4))getColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*2,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      height: 350,
                      width: 350,
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
                                  stops:const [0, 0.0, 0.65],
                                  colors: [
                                    Colors.orange.withOpacity(0.45),
                                    Colors.orange.withOpacity(0.45),
                                    Colors.transparent,
                                  ]),
                            )),
                      ),
                    ),
                  ),
                  // First Circle
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: roundColor==4?Colors.orange.withOpacity(0.50):Colors.orange)
                        ),
                      ),
                    ),
                  ),
                  // Second Circle
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Container(
                        margin: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: roundColor==1||roundColor==3?Colors.orange.withOpacity(0.5):Colors.orange)),
                      ),
                    ),
                  ),
                  // Third Circle
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Container(
                        margin: const EdgeInsets.all(64),
                        height: 55.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: roundColor==2?Colors.orange.withOpacity(0.5):Colors.orange)),
                      ),
                    ),
                  ),
                  // Center of all circle widget
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Container(
                        alignment: Alignment.center,
                        height: 55.h,
                        width: 80.w,
                        child: Container(
                          height: 90,
                          width: 90,
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
                                topRight: Radius.circular(95 * .05),
                                bottomLeft: Radius.circular(95 * .05),
                                bottomRight: Radius.circular(95 * .3),
                                topLeft: Radius.circular(95 * .3),
                              ),
                              border: Border.all(color: Colors.deepPurple)
                          ),
                          // child: const Text("hello")
                        ),
                      ),
                    ),
                  ),
                  // Bottom box
                  Positioned(
                    top: 470,
                    child: Container(
                      height: 100.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                          border: Border.all(color: Colors.cyan.shade200, width: 1)
                      ),
                    ),
                  ),
                  // Bottom box sepration
                  Positioned(
                    top: 520,
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.cyan.shade200, width: 1))),
                    ),
                  ),
                  // First widget left side on top
                  AnimatedPositioned(
                      key: const Key("firstlefttop"),
                      top: animateItemsFirstRound?210:550,
                      left: 85,
                      duration: animationDuration,
                      child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  // First widget left side on bottom
                  AnimatedPositioned(
                      key: const Key("firstleftbottom"),
                      top: animateItemsFirstRound?370:610,
                      left: 85,
                      duration: animationDuration,
                      child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  // First widget right side on top
                  AnimatedPositioned(
                      key: const Key("firstrighttop"),
                      top: animateItemsFirstRound?110:680,
                      right: animateItemsFirstRound?110:null,
                      left: !animateItemsFirstRound?85:null,
                      duration: animationDuration,
                      child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  // First widget right side on bottom
                  AnimatedPositioned(
                      key: const Key("firstrightbottom"),
                      duration: animationDuration,
                      top: animateItemsFirstRound?370:750,
                      right: animateItemsFirstRound?90:null,
                      left: !animateItemsFirstRound?85:null,
                      child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  // Second widget right side on top
                  getView(ViewType.secondrighttop),
                  // Second widget right side on bottom
                  getView(ViewType.secondrightbottom),
                  // Second widget left side on top
                  getView(ViewType.secondlefttop),
                  // Second widget left side on bottom
                  getView(ViewType.secondleftbottom)
                ],
              ),
            ),
          ),
        ));
  }


  // widget create point with text
  Widget buildPointViewWithText(bool isVisibleText){
    return Row(
      children: [
        const DrawContainer(),
        isVisibleText?containerTestTextWidget():Container()
      ],
    );
  }

  // Widget show test text of
  Widget containerTestTextWidget() {
    return MyFadeIn(
      child: Container(
        margin: const EdgeInsets.only(left: 40),
        child: const Text(
          "test",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }

  // Get view type and show view of circle and change postion
  Widget getView(ViewType viewType) {
    if(showRoundSecondIcons){
      switch(viewType){
        case ViewType.secondrighttop:
          return AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              key: const Key("secondrighttop"),
              duration: animationDuration,
              top: animateItemsSecondRound?150:820,
              right: animateItemsSecondRound?40:null,
              left: !animateItemsSecondRound?85:null,
              child: buildPointViewWithText(!animateItemsSecondRound)
          );
        case ViewType.secondrightbottom:
          return AnimatedPositioned(
              key: const Key("secondrightbottom"),
              duration: animationDuration,
              top: animateItemsSecondRound?290:890,
              right: animateItemsSecondRound?100:null,
              left: !animateItemsSecondRound?85:null,
              child: buildPointViewWithText(!animateItemsSecondRound)
          );
        case ViewType.secondleftbottom:
          return AnimatedPositioned(
              key: const Key("secondleftbottom"),
              duration: animationDuration,
              top: animateItemsSecondRound?370:960,
              left: 85,
              child: buildPointViewWithText(!animateItemsSecondRound)
          );
        case ViewType.secondlefttop:
          return AnimatedPositioned(
              key: const Key("secondlefttop"),
              duration: animationDuration,
              top: animateItemsSecondRound?150:1030,
              left:animateItemsSecondRound?30:85,
              child: buildPointViewWithText(!animateItemsSecondRound)
          );
      }
    }
    return Container();
  }
}