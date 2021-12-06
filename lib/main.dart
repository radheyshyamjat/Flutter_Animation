import 'package:animation_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Constraint for only portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((item) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(secondary: CustomColor.primary),
            ),
            home: const MyHomePage(),
          );
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int round=0;
  int position = 1;
  int roundColor = 0;
  bool animateItemsFirstRound = true;
  bool showRoundSecondIcons = false;
  bool animateItemsSecondRound = true;

  final animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    startAnimation();
    startCircle();
    getColor();
  }

  // Circle color scheme animation
  Future<void> startCircle() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      position += 1;
    });
  }

  // Secondary items animation
  void secondAnimate() async {
    showRoundSecondIcons=true;
    await Future.delayed(const Duration(milliseconds: 200));
    animateItemsSecondRound=false;
  }

  // Primary items animation
  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    animateItemsFirstRound=false;
  }

  // Circle animation
  Alignment getBegin() {
    if (position == 2) {
      return Alignment.centerRight;
    } else if (position == 3) {
      return Alignment.bottomCenter;
    } else if (position == 4) {
      return Alignment.centerLeft;
    }
    return Alignment.topCenter;
  }

  // Circle animation
  Alignment getEnd() {
    if (position == 2) {
      return Alignment.centerLeft;
    } else if (position == 3) {
      return Alignment.topCenter;
    } else if (position == 4) {
      return Alignment.centerRight;
    }
    return Alignment.bottomCenter;
  }

  // Circle decoration color
  getColor()async{
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      roundColor+=1;
      if(!(roundColor==4))getColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: CustomColor.primary,
      ),
      backgroundColor: CustomColor.primary,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var height = constraints.maxHeight;
          var width = constraints.maxWidth;
          return SingleChildScrollView(
            child: SizedBox(
              height: height*2,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      height: 350,
                      width: 350,
                      child: AnimatedContainer(
                          onEnd: () {
                            setState(() {
                              animationEndChangeTimer();
                            });
                          },
                          duration: const Duration(milliseconds: 80),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient:
                            LinearGradient(begin: getBegin(), end: getEnd(),
                                stops:const [0, 0.0, 0.65],
                                colors: [
                                  Colors.orange.withOpacity(0.45),
                                  Colors.orange.withOpacity(0.45),
                                  Colors.transparent,
                                ]),
                          )),
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
          );
        },
      ),
    );
  }

  // widget create point with text
  Widget buildPointViewWithText(bool isVisibleText){
    return Row(
      children: [
        containerWidget(),
        isVisibleText?containerTestTextWidget():Container()
      ],
    );
  }

  // widget of create container  circle
  Widget containerWidget() {
    return FadeIn(
      duration:const Duration(milliseconds: 200),
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

  // Widget show test text of
  Widget containerTestTextWidget() {
    return FadeIn(
      duration: const Duration(milliseconds: 700),
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

  // animation round 3 times
  void animationEndChangeTimer() async{
    if (position == 5) {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        if(round==1)secondAnimate();
        if(round==2){
        }else{
          position=2;
          round+=1;
        }
      });
    } else {
      setState(() {
        position += 1;
      });
    }
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
          break;
      }
    }
    return Container();
  }
}

// Enum view type
enum ViewType {
  secondrighttop,
  secondrightbottom,
  secondleftbottom,
  secondlefttop,
}

// class OpenPainter extends CustomPainter {
//   final double offsetDx;
//   final double offsetDy;
//   final double radius;
//   final bool isShowBlur;
//
//   OpenPainter(this.offsetDx, this.offsetDy, this.radius, this.isShowBlur);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint1 = Paint()
//       ..color = Colors.orange
//       ..maskFilter = MaskFilter.blur(BlurStyle.normal, isShowBlur ? 0.9 : 0)
//       ..strokeWidth = isShowBlur ? 0.5 : 1
//       ..style = PaintingStyle.stroke;
//     // canvas.drawCircle(Offset(size.width/2,size.width/2.5), size.width/2.7, paint1);
//     canvas.drawCircle(Offset(offsetDx, offsetDy), radius, paint1);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
