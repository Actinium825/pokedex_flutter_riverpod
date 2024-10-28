import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';

class PokemonTypeName extends StatelessWidget {
  const PokemonTypeName({
    required this.name,
    this.primaryColor,
    super.key,
  });

  final String name;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pokemonTypeNamePadding,
      margin: pokemonTypeNameMargin,
      decoration: primaryColor == null
          ? null
          : BoxDecoration(
              color: PokemonColorPicker.typeDecorationColor(primaryColor!),
              borderRadius: BorderRadius.circular(typeNameRadius),
            ),
      child: Text(
        name.capitalize(),
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}
