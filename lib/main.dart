import 'package:crazy_buttons/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GigiEconoSounds',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'MamaBear'
      ),
      home: SplashPage(),
    );
  }
}
