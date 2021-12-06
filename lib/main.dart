import 'package:animation_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((item) {
    runApp(MyApp());
  });
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.light),
  // );
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

class MainApp extends StatelessWidget{
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
    },
    child: Text("Click"),),);
  }

}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int round=0;
  bool animateItemsFirstRound = true;
  bool showRoundSecondIcons = false;
  bool animateItemsSecondRound = true;
  // int secondAnimation=0;

  final animationDuration = const Duration(milliseconds: 300);
  final _myDuration = const Duration(seconds: 1);
  int position = 1;

  @override
  void initState() {
    super.initState();
    startAnimation();
    startCircle();
  }

  Future<void> startCircle() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      position += 1;
    });
  }

  void secondAnimate() async {
    // secondAnimation=1;
    showRoundSecondIcons=true;
    await Future.delayed(const Duration(milliseconds: 200));
    animateItemsSecondRound=false;
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    animateItemsFirstRound=false;
  }

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
                              print("Animation end$position");
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
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Container(
                        // height: 55.h,
                        // width: 80.w,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.cyan,
                            border: Border.all(color: Colors.orange)
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Container(
                        margin: EdgeInsets.all(32),
                        // height: 55.h,
                        // width: 60.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Container(
                        margin: EdgeInsets.all(64),
                        height: 55.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange)),
                      ),
                    ),
                  ),
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
                            // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
                          ),
                          // child: const Text("hello")
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 470,
                    child: Container(
                      height: 100.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                          border: Border.all(color: Colors.cyan.shade200, width: 1)
                        // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
                      ),
                    ),
                  ),
                  Positioned(
                    top: 520,
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.cyan.shade200, width: 1))),
                    ),
                  ),
                  AnimatedPositioned(
                    key: const Key("firstlefttop"),
                    top: animateItemsFirstRound?210:550,
                    left: 85,
                    duration: animationDuration,
                    child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  AnimatedPositioned(
                    key: const Key("firstleftbottom"),
                    top: animateItemsFirstRound?370:610,
                    left: 85,
                    duration: animationDuration,
                    child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  AnimatedPositioned(
                    key: const Key("firstrighttop"),
                    top: animateItemsFirstRound?110:680,
                    right: animateItemsFirstRound?110:null,
                    left: !animateItemsFirstRound?85:null,
                    duration: animationDuration,
                    child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  AnimatedPositioned(
                      key: const Key("firstrightbottom"),
                      duration: animationDuration,
                      top: animateItemsFirstRound?370:750,
                      right: animateItemsFirstRound?90:null,
                      left: !animateItemsFirstRound?85:null,
                      child: buildPointViewWithText(!animateItemsFirstRound)
                  ),
                  getView(ViewType.secondrighttop),
                  getView(ViewType.secondrightbottom),
                  getView(ViewType.secondlefttop),
                  getView(ViewType.secondleftbottom)

                  // Visibility(
                  //   visible: secondAnimation==0?false:true,
                  //   child: AnimatedPositioned(
                  //       key: const Key("secondrightbottom"),
                  //       duration: animationDuration,
                  //       top: secondAnimation==1?290:secondAnimation==2?890:null,
                  //       // top: !animateItemsSecondRound?290:890,
                  //       right: secondAnimation==1?100:null,
                  //       left: secondAnimation==2?85:null,
                  //       child: buildPointViewWithText(secondAnimation==2)
                  //   ),
                  // ),
                  // Visibility(
                  //   visible: secondAnimation==0?false:true,
                  //   child: AnimatedPositioned(
                  //       key: const Key("secondleftbottom"),
                  //       duration: animationDuration,
                  //       top: secondAnimation==1?370:secondAnimation==2?960:null,
                  //       // top: !animateItemsSecondRound?370:960,
                  //       left: 85,
                  //       child: buildPointViewWithText(secondAnimation==2)
                  //   ),
                  // ),
                  // Visibility(
                  //   visible: secondAnimation==0?false:true,
                  //   child: AnimatedPositioned(
                  //       key: const Key("secondlefttop"),
                  //       duration: animationDuration,
                  //       top: secondAnimation==1?150:secondAnimation==2?1030:null,
                  //       left:secondAnimation==1?30:secondAnimation==2?85:null,
                  //       child: buildPointViewWithText(secondAnimation==2)
                  //   ),
                  // ),

                  // Visibility(
                  //   visible: secondAnimation==0?false:true,
                  //   child: AnimatedPositioned(
                  //     key: const Key("secondleftbottom"),
                  //       duration: animationDuration,
                  //       top: secondAnimation==1?height * 0.48:secondAnimation==2?height * 1.35:null,
                  //       left:width* 0.22,
                  //       child: buildPointViewWithText(secondAnimation==2)
                  //   ),
                  // ),
                  // Visibility(
                  //   visible: secondAnimation==0?false:true,
                  //   child: AnimatedPositioned(
                  //       key: const Key("secondlefttop"),
                  //       duration: animationDuration,
                  //       top: secondAnimation==1?height * 0.12:secondAnimation==2?height * 1.46:null,
                  //       left: secondAnimation==1?width* 0.15:secondAnimation==2?width * 0.22:null,
                  //       child: buildPointViewWithText(secondAnimation==2)
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPointViewWithText(bool isVisibleText){
    return Row(
      children: [
        containerWidget(),
        isVisibleText?containerTestTextWidget():Container()
      ],
    );
  }

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
            // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
            ),
        // child: const Text("hello")
      ),
    );
  }

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

  Widget animatedPosition(
      {required String key,
      required bool isShowText,
      double? left,
      double? right,
      double? top,
      double? bottom}) {
    return AnimatedPositioned(
      key: Key(key),
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: animationDuration,
      child: Row(
        children: [
          Container(
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
                // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
                ),
            // child: const Text("hello")
          ),
          Visibility(
            visible: !isShowText,
            child: Container(
              margin: const EdgeInsets.only(left: 40),
              child: const Text(
                "test",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  void animationEndChangeTimer() async{
    print("Animation end change method called");
    if (position == 5) {
      print("before await");
      await Future.delayed(const Duration(milliseconds: 500));
      print("after await");
      setState(() {
        if(round==1){
          secondAnimate();
        }
        if(round==2){
        }else{
          position=2;
          round+=1;
        }
      });
    } else {
      setState(() {
        print("Position increment$position");
        position += 1;
      });
    }
  }

  Widget getView(ViewType viewType) {
    if(showRoundSecondIcons){
      switch(viewType){
        case ViewType.secondrighttop:
          return AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              key: const Key("secondrighttop"),
              duration: animationDuration,
              top: animateItemsSecondRound?150:820,
              // top: 150,
              right: animateItemsSecondRound?40:null,
              // right: 40,
              left: !animateItemsSecondRound?85:null,
              // left: !animateItemsSecondRound?85:null,
              child: buildPointViewWithText(!animateItemsSecondRound)
          );
        case ViewType.secondrightbottom:
          return AnimatedPositioned(
                  key: const Key("secondrightbottom"),
                  duration: animationDuration,
                  top: animateItemsSecondRound?290:890,
                  // top: !animateItemsSecondRound?290:890,
                  right: animateItemsSecondRound?100:null,
                  left: !animateItemsSecondRound?85:null,
                  child: buildPointViewWithText(!animateItemsSecondRound)
              );
          break;
        case ViewType.secondleftbottom:
          return AnimatedPositioned(
                  key: const Key("secondleftbottom"),
                  duration: animationDuration,
                  // top: secondAnimation==1?370:secondAnimation==2?960:null,
                  top: animateItemsSecondRound?370:960,
                  left: 85,
                  child: buildPointViewWithText(!animateItemsSecondRound)
              );
          break;
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
    if(showRoundSecondIcons){
      return AnimatedPositioned(
          curve: Curves.fastOutSlowIn,
          key: const Key("secondrighttop"),
          duration: animationDuration,
          // top: animateItemsSecondRound?150:820,
          top: 150,
          // right: animateItemsSecondRound?40:null,
          right: 40,
          // left: !animateItemsSecondRound?85:null,
          // left: !animateItemsSecondRound?85:null,
          child: buildPointViewWithText(!animateItemsSecondRound)
      );
    }else {
      return Container();
    }
  }
}
enum ViewType {
  secondrighttop,
  secondrightbottom,
  secondleftbottom,
  secondlefttop,
}

class OpenPainter extends CustomPainter {
  final double offsetDx;
  final double offsetDy;
  final double radius;
  final bool isShowBlur;

  OpenPainter(this.offsetDx, this.offsetDy, this.radius, this.isShowBlur);

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.orange
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, isShowBlur ? 0.9 : 0)
      ..strokeWidth = isShowBlur ? 0.5 : 1
      ..style = PaintingStyle.stroke;
    // canvas.drawCircle(Offset(size.width/2,size.width/2.5), size.width/2.7, paint1);
    canvas.drawCircle(Offset(offsetDx, offsetDy), radius, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
