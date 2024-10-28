import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';

class PokemonColorPicker {
  static Color getColor(String type) => switch (type) {
        'normal' => const Color(0xffA8A77A),
        'fire' => const Color(0xffF5AC78),
        'water' => const Color(0xff9DB7F5),
        'electric' => const Color(0xffF7D02C),
        'grass' => const Color(0xffA7DB8D),
        'ice' => const Color(0xff96D9D6),
        'fighting' => const Color(0xffC22E28),
        'poison' => const Color(0xffA33EA1),
        'ground' => const Color(0xffE2BF65),
        'flying' => const Color(0xffA98FF3),
        'psychic' => const Color(0xffF95587),
        'bug' => const Color(0xffA6B91A),
        'rock' => const Color(0xffB6A136),
        'ghost' => const Color(0xff735797),
        'dragon' => const Color(0xff6F35FC),
        'dark' => const Color(0xff705746),
        'steel' => const Color(0xffB7B7CE),
        'fairy' => const Color(0xffD685AD),
        _ => const Color(0xffffffff),
      };

  static Color typeDecorationColor(Color color, {bool isDarkened = false}) {
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(hsl.lightness + (isDarkened ? -colorModifier : colorModifier));

    return hslLight.toColor();
  }
}
