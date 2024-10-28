import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/widgets/pokemon_type_name.dart';

class PokemonTypeList extends StatelessWidget {
  const PokemonTypeList({
    required this.pokemon,
    this.isDecorationShown = false,
    super.key,
  });

  final PokemonDto pokemon;
  final bool isDecorationShown;

  @override
  Widget build(BuildContext context) {
    final primaryTypeName = pokemon.primaryTypeName;
    final primaryColor = isDecorationShown ? PokemonColorPicker.getColor(primaryTypeName) : null;
    final typeList = pokemon.typeList;
    final children = [
      PokemonTypeName(
        name: primaryTypeName,
        primaryColor: primaryColor,
      ),
      if (typeList.length > 1)
        PokemonTypeName(
          name: typeList.second.name,
          primaryColor: primaryColor,
        ),
    ];

    return isDecorationShown
        ? Row(children: children)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
  }
}
