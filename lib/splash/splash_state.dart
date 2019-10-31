import 'dart:math';

import 'package:crazy_buttons/home/home_page.dart';
import 'package:crazy_buttons/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: new Transform.rotate(
        angle: animation.value,
        child: new Image(image: new AssetImage("assets/images/logo.png")),
      ),
    );
  }
}

class SplashState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    animateSplash();
    splashTimer();
  }

  void animateSplash() {
    controller =
        AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0, end: 2*pi).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
    controller.forward();
  }

  void splashTimer() {
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        children: <Widget>[
          Center(
            child: new Image(image: new AssetImage("assets/images/inda.gif")),
          ),
          Positioned(
              top: 80.0,
              left: 10.0,
              right: 10.0,
              child: Center(
                  child: Text("EconoSounds",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      )))),
          Positioned(
              bottom: 80.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                  child: Text("by Gigigo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )))),
          AnimatedLogo(animation: animation)
        ],
      ),
    );
  }
}
