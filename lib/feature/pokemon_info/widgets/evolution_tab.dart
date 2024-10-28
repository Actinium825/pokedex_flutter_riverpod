import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_evolution_chain_ext.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/widgets/evolution_card.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_evolution_chain_dto.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({
    required this.pokemonEvolutionChain,
    required this.pokemonEvolutionList,
    super.key,
  });

  final List<PokemonDto> pokemonEvolutionList;
  final PokemonEvolutionChainDto pokemonEvolutionChain;

  void _replaceWidget(List<Widget> children, List<int> gridIndices, int pokemonIndex) {
    final hasNoEvolution = pokemonEvolutionList.length == 1;
    for (final gridIndex in gridIndices) {
      children
        ..removeAt(gridIndex)
        ..insert(
          gridIndex,
          EvolutionCard(
            pokemon: pokemonEvolutionList[pokemonIndex++],
            index: hasNoEvolution ? null : gridIndex,
          ),
        );
    }
  }

  void _handleEeveeCase(List<Widget> children) => children
    ..replaceRange(
      0,
      pokemonEvolutionList.length,
      pokemonEvolutionList.sublist(1).map((pokemon) => EvolutionCard(pokemon: pokemon)),
    )
    ..insert(
      4,
      EvolutionCard(
        pokemon: pokemonEvolutionList.first,
        isEevee: true,
      ),
    );

  void _updateGrid(List<Widget> children) {
    int index = 0;

    if (pokemonEvolutionList.length == 1) return _replaceWidget(children, [4], index++);

    _replaceWidget(children, [3], index++);

    switch (pokemonEvolutionChain.stage2Evolutions.length) {
      case 1:
        _replaceWidget(children, [4], index++);
      case 2:
        _replaceWidget(children, [1, 7], index++);
      case 3:
        _replaceWidget(children, [1, 4, 7], index++);
      case 8:
        _handleEeveeCase(children);
    }

    switch (pokemonEvolutionChain.stage3Evolutions.length) {
      case 1:
        _replaceWidget(children, [5], index++);
      case 2:
        _replaceWidget(children, [2, 8], index++);
      case 3:
        _replaceWidget(children, [2, 5, 8], index++);
    }
  }

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>.generate(evolutionGridCount, (_) => const SizedBox());
    _updateGrid(children);
    return AlignedGridView.count(
      itemCount: evolutionGridCount,
      padding: evolutionTabMargin,
      crossAxisCount: evolutionGridCrossAxisCount,
      mainAxisSpacing: evolutionGridMainAxisSpacing,
      itemBuilder: (_, index) => children[index],
    );
  }
}
