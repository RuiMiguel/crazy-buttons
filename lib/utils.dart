import 'dart:async';
import 'dart:math' as math;

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static final AudioCache audioPlayer = new AudioCache();

  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  static Future<String> loadJsonFromFile(String file) async {
    return rootBundle.loadString(file);
  }

  static wait(int seconds, [FutureOr<Null> callback()]) {
    return new Future.delayed(Duration(seconds: seconds), callback);
  }

  static Future playMedia(String media) async {
    print("play media $media");

    audioPlayer.clearCache();
    audioPlayer.play(media);
  }
}
