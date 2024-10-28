import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_type_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/widgets/pokemon_type_name.dart';

class PokemonTypeList extends StatelessWidget {
  const PokemonTypeList({
    required this.pokemon,
    super.key,
  });

  final PokemonDto pokemon;

  @override
  Widget build(BuildContext context) {
    final typeList = pokemon.typeList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PokemonTypeName(name: pokemon.primaryTypeName),
        if (typeList.length > 1) PokemonTypeName(name: typeList.second.name),
      ],
    );
  }
}
