import 'dart:async';
import 'dart:math' as math;

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class Utils {
  static final AudioPlayer audioPlayer = new AudioPlayer();

  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  static Future<String> loadJsonFromFile(String file) async {
    return await rootBundle.loadString(file);
  }

  static wait(int seconds, [FutureOr<Null> callback()]) {
    return new Future.delayed(Duration(seconds: seconds), callback);
  }

  static Future playMedia(String media) async {
    print("play media $media");
    await AudioCache().play(media);

    /*
    if(audioPlayer.state == AudioPlayerState.PLAYING) {
      audioPlayer.stop();
    }
    else {
      audioPlayer.setVolume(1.0);
      await audioPlayer.play(media, isLocal: true);
    }
     */
  }
}
