import 'dart:async';
import 'dart:math' as math;

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

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

    assetsAudioPlayer.stop();
    assetsAudioPlayer.open(AssetsAudio(
      asset: media,
      folder: "assets/audios/",
    ));
    assetsAudioPlayer.play();
  }
}
