// Created by Muhammed Tolkinov on 14-October-2022

import 'dart:ui';

abstract class BaseColors {
  const BaseColors();

  Color get primary => const Color.fromRGBO(84, 191, 20, 1);
  Color get secondary => const Color.fromRGBO(247, 248, 249, 1);
  Color get gray => const Color.fromRGBO(248, 248, 248, 1);
  Color get stroke => const Color.fromRGBO(50, 58, 70, 1);
  Color get information => const Color.fromRGBO(55, 135, 255, 1);

  Color get red => const Color.fromRGBO(213, 57, 64, 1);
  Color get red900 => const Color.fromRGBO(233, 57, 64, 1);

  Color get black => const Color.fromRGBO(0, 0, 0, 1);
  Color get text900 => const Color.fromRGBO(54, 69, 79, 1);
  Color get text800 => const Color.fromRGBO(33, 42, 49, 1);
  Color get text700 => const Color.fromRGBO(51, 51, 51, 1);

  Color get textSecondary => const Color.fromRGBO(137, 143, 147, 1);

  Color get background;
}
