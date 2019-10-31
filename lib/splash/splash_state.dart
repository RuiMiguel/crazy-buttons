import 'package:crazy_buttons/home/home_page.dart';
import 'package:crazy_buttons/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
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
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
    // #enddocregion print-state
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
    // #docregion print-state
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }

  void splashTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(title: 'Crazy buttons by GigiEconoSounds')),
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
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedLogo(animation: animation),
          new Image(image: new AssetImage("assets/inda.gif"))
        ],
      ),
    );
  }
}
