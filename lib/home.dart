import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// 146, 221, 250, 1
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Color lightBlue = Color.fromRGBO(84, 201, 247, 1);
  final Color lightGreen = Color.fromRGBO(77, 220, 135, 1);
  final Color lightBlueShadow = Color.fromRGBO(146, 221, 250, 1);
  final Color lightGreenShadow = Color.fromRGBO(40, 202, 105, 1);

  List<Color> containerColor;

  double btnWidth = 180;
  double btnHeight = 60;

  double iconLeftPadding = 0;
  double textRightPadding = 30;

  double iconSize = 30;
  double smallContainerSize = 0;

  double iconFadeEnd = 0;

  IconData icon = Icons.send;

  String text = "Send";

  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    containerColor = [lightBlue, lightBlueShadow];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: MediaQuery.of(context).size.width / 2 - 90,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn,
              tween: Tween<double>(begin: btnWidth, end: btnWidth),
              builder: (context, width, child) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      text = '';
                      btnWidth = 80;
                      textRightPadding = 0;
                    });
                    Timer(Duration(milliseconds: 700), () {
                      setState(() {
                        iconLeftPadding = 120;
                        btnWidth = 180;
                      });
                      Timer(Duration(milliseconds: 400), () {
                        setState(() {
                          iconSize = 0;
                        });
                      });
                    });
                    Timer(Duration(milliseconds: 1000), () {
                      setState(() {
                        smallContainerSize = 20;
                      });
                      Timer(Duration(milliseconds: 100), () {
                        animationController.forward();
                      });
                    });
                    Timer(Duration(milliseconds: 1400), () {
                      setState(() {
                        icon = Icons.check;
                        iconLeftPadding = 0;
                        iconSize = 30;
                      });
                    });
                    Timer(Duration(milliseconds: 2400), () {
                      setState(() {
                        textRightPadding = 30;
                        text = 'Sent';
                        containerColor = [lightGreen, lightGreenShadow];
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 30, right: textRightPadding),
                    alignment: Alignment.center,
                    width: width,
                    height: btnHeight,
                    decoration: BoxDecoration(
                      color: containerColor[0],
                      borderRadius: BorderRadius.circular(btnHeight / 2),
                      boxShadow: [
                        BoxShadow(
                          color: containerColor[1],
                          offset: Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: child,
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 900),
                    curve: Curves.fastOutSlowIn,
                    padding: EdgeInsets.only(left: iconLeftPadding),
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 30, end: iconSize),
                      duration: Duration(milliseconds: 300),
                      builder: (context, size, child) {
                        return Icon(icon, color: Colors.white, size: size);
                      },
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: Tween<double>(begin: 1, end: 0)
                        .animate(animationController),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: smallContainerSize,
                      height: smallContainerSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  FadeTransition(
                    opacity: Tween<double>(begin: 1, end: 0)
                        .animate(animationController),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: smallContainerSize,
                      height: smallContainerSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  FadeTransition(
                    opacity: Tween<double>(begin: 1, end: 0)
                        .animate(animationController),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: smallContainerSize,
                      height: smallContainerSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
