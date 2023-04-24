// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:avitus/presentation/assets/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  bool loadingInProgress = false;
  late Animation<double> angleAnimation;

  late Animation<double> scaleAnimation;

  late AnimationController controller;
  double size = 0;
  double size1 = 0;
  double size2 = 0;
  double size3 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initFunc();
  }

  initFunc() async {
    loadingInProgress = true;
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    angleAnimation = Tween(begin: 0.0, end: 360.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (angleAnimation.status == AnimationStatus.forward) {
            size1 = angleAnimation.value;
          } else {
            size1 = 361 - angleAnimation.value;
          }
        });
      });
    //await Future.delayed(const Duration(milliseconds: 3000));
    scaleAnimation = Tween(begin: 0.0, end: 15.0).animate(controller)
      ..addListener(() {
        size = scaleAnimation.value;
      });

    angleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (loadingInProgress) {
          controller.reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        if (loadingInProgress) {
          controller.forward();
        }
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: buildSquare(size, AppTheme.colors.primary)),
    );
  }

  Widget buildCircle(double circleWidth, Color color) {
    return Transform.rotate(
      angle: size1 / 360 * 2 * pi,
      child: Container(
        margin: EdgeInsets.all(size),
        width: 30,
        height: 30,
        //transform: Matrix4.identity()..scale(size),
        decoration: BoxDecoration(
          color: color,
          //border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(size),
        ),
      ),
    );
  }

  Widget buildSquare(double circleWidth, Color color) {
    return Transform.rotate(
      angle: size1 / 360 * 2 * pi,
      child: Container(
        width: 200,
        height: 200,
        //transform: Matrix4.identity()..scale(size),
        decoration: BoxDecoration(
            // border: Border.all(color: color, width: 5),
            //borderRadius: BorderRadius.circular(70),
            ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCircle(circleWidth, color.withOpacity(0.25)),
                buildCircle(circleWidth, color),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCircle(circleWidth, color),
                buildCircle(circleWidth, color.withOpacity(0.25)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
