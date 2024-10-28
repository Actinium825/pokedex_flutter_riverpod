import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/widgets/about_tab.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/widgets/evolution_tab.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/widgets/moves_tab.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_evolution_chain_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_evolution_list_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_info_page_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:pokedex_flutter_riverpod/widgets/loading_indicator.dart';

class InfoTabBody extends ConsumerWidget {
  const InfoTabBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonInfoPageValue = ref.watch(pokemonInfoPageProvider);
    final selectedPokemon = ref.read(selectedPokemonProvider);
    final typeDecorationColor = PokemonColorPicker.typeDecorationColor(selectedPokemon.primaryColor, isDarkened: true);

    return pokemonInfoPageValue.when(
      data: (_) => Column(
        children: [
          TabBar(
            labelColor: typeDecorationColor,
            indicatorColor: typeDecorationColor,
            unselectedLabelColor: context.themeData.unselectedWidgetColor,
            tabs: tabLabels.map((tabLabel) => Tab(text: tabLabel)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AboutTab(selectedPokemon: selectedPokemon),
                EvolutionTab(
                  pokemonEvolutionChain: ref.read(pokemonEvolutionChainProvider),
                  pokemonEvolutionList: ref.read(pokemonEvolutionListProvider),
                ),
                MovesTab(selectedPokemon: selectedPokemon),
              ],
            ),
          ),
        ],
      ),
      error: (_, __) => const SizedBox(),
      loading: () => LoadingIndicator(color: typeDecorationColor),
    );
  }
}
