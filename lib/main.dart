import 'dart:math';

import 'package:animation_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shapes/flutter_shapes.dart';


void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: CustomColor.primary),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool startAnimationFirst=true;
  bool startAnimationSecond=true;
  bool startAnimationThird=true;
  bool startAnimationForth=true;
  final animationDuration = const Duration(milliseconds: 5000);
  final _myDuration =const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds:500));
    startAnimationFirst=false;
    startAnimationSecond=false;
    startAnimationThird=false;
    startAnimationForth=false;
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
      body:
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         height: 55,
      //         width: 55,
      //         decoration: BoxDecoration(
      //             color: CustomColor.cardFillColor,
      //             boxShadow:const [
      //               BoxShadow(
      //                 color: CustomColor.cardFillColor,
      //                 spreadRadius: 2,
      //                 blurRadius: 5,
      //                 offset: Offset(0, 0), // changes position of shadow
      //               ),
      //             ],
      //             borderRadius:const BorderRadius.only(
      //               topLeft:Radius.circular(55.0),
      //               topRight:Radius.circular(14.0),
      //               bottomLeft:Radius.circular(14.0),
      //               bottomRight:Radius.circular(55.0),
      //             ),
      //             border: Border.all(color: CustomColor.cardBorderColor)
      //           // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
      //         ),
      //         // child: const Text("hello")
      //       ),
      //       SizedBox(height: 25,),
      //       Container(
      //         height: 55,
      //         width: 95,
      //         decoration: BoxDecoration(
      //             color: CustomColor.cardFillColor,
      //             boxShadow: [
      //               const BoxShadow(
      //                 color: CustomColor.cardFillColor,
      //                 spreadRadius: 2,
      //                 blurRadius: 5,
      //                 offset: Offset(0, 0), // changes position of shadow
      //               ),
      //             ],
      //             borderRadius:const BorderRadius.only(
      //               topLeft:Radius.circular(40.0),
      //               topRight:Radius.circular(4.0),
      //               bottomLeft:Radius.circular(4.0),
      //               bottomRight:Radius.circular(40.0),
      //             ),
      //             border: Border.all(color: CustomColor.cardBorderColor)
      //           // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
      //         ),
      //         // child: const Text("hello")
      //       ),
      //     ],
      //   ),
      //   // ),
      //   // child: CustomPaint(
      //   //   painter: MyPainter(),
      //   // ),
      // )
      Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height/50,
              child: SizedBox(
                width: MediaQuery.of(context).size.height/1.5,
                child: CustomPaint(
                  painter: OpenPainter(),
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height/50,
              child: SizedBox(
                width: MediaQuery.of(context).size.height/1.5,
                 child: CustomPaint(
                  painter: OpenPainterSecond(),
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height/50,
              child: SizedBox(
                width: MediaQuery.of(context).size.height/1.5,
                 child: CustomPaint(
                  painter: OpenPainterThird(),
                ),
              )),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                    borderRadius:const BorderRadius.only(topLeft:Radius.circular(14.0),topRight:Radius.circular(14.0)),
                    border: Border.all(color: CustomColor.cardBorder)
                  // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
                ),
              // child: const Text("hello")
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height/2.9,
            child: Container(
                width: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.cardBorder,width: 0.5)
                ),
            ),
          ),
          animatedPosition(key: "firstcardanimajte",isShowText:startAnimationFirst,left: startAnimationFirst?80:70,bottom:startAnimationFirst?MediaQuery.of(context).size.height/1.5:170),
          animatedPosition(key: "secondcardanimate",isShowText:startAnimationSecond,left: startAnimationSecond?80:70,bottom:startAnimationSecond?MediaQuery.of(context).size.height/2.22:100),
          animatedPosition(key: "thirdcardanimate",isShowText:startAnimationThird,right: startAnimationThird?75:null,left: startAnimationThird?null:70,bottom: startAnimationThird?MediaQuery.of(context).size.height/2.1:30),
          animatedPosition(key: "forthcardanimate",isShowText:startAnimationForth,right:startAnimationForth?75:null,left: startAnimationForth?null:70,bottom: startAnimationForth?MediaQuery.of(context).size.height/1.3:-50),
          Positioned(
            top: MediaQuery.of(context).size.height/4.5,
            child: Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        boxShadow:const [
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
        ],
      ),
    );
  }

  Widget animatedPosition({required String key,required bool isShowText, double? left, double? right, double? top, double? bottom}){
    return AnimatedPositioned(
      key: Key(key),
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      curve: Curves.fastLinearToSlowEaseIn,
      duration:animationDuration,
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                boxShadow:const [
                  BoxShadow(
                    color: Colors.deepPurple,
                    spreadRadius: 1,
                    blurRadius: 11,
                  ),
                ],
                borderRadius:const BorderRadius.only(
                  topLeft:Radius.circular(55.0),
                  topRight:Radius.circular(14.0),
                  bottomLeft:Radius.circular(14.0),
                  bottomRight:Radius.circular(55.0),
                ),
                border: Border.all(color: Colors.deepPurple)
              // border:Border(top: BorderSide(color: CustomColor.cardBorder,),left:BorderSide(color: CustomColor.cardBorder),right: BorderSide(color: CustomColor.cardBorder))
            ),
            // child: const Text("hello")
          ),
          Visibility(
            visible: !isShowText,
            child: Container(margin:const EdgeInsets.only(left: 40),
            child: const Text("test",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),),),
          )
        ],
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = CustomColor.circleBorder
      ..strokeWidth =1
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width/2,size.width/2.5), size.width/2.7, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainterSecond extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = CustomColor.circleBorder
      ..strokeWidth =1
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width/2,size.width/2.5), size.width/3.3, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainterThird extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = CustomColor.circleBorder
      ..strokeWidth =1
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width/2,size.width/2.5), size.width/4.3, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}