import 'package:crazy_buttons/home/home_page.dart';
import 'package:crazy_buttons/splash/splash_page.dart';
import 'package:flutter/material.dart';

class SplashState extends State<SplashPage> {
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.horizontal;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(title: 'Crazy buttons by GigiEconoSounds')),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterLogo(
      size: 200.0,
      textColor: Color.fromRGBO(256, 0, 0, 1.0),
      style: _logoStyle,
    );
  }
}