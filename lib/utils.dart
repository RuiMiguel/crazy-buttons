import 'dart:math' as math;

import 'package:flutter/material.dart';

class Utils {
  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
}