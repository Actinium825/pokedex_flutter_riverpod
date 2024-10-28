import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/widgets/about_tab.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_species_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:pokedex_flutter_riverpod/widgets/loading_indicator.dart';

class InfoTabBody extends ConsumerWidget {
  const InfoTabBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPokemonSpecies = ref.watch(selectedPokemonSpeciesProvider);
    final selectedPokemon = ref.read(selectedPokemonProvider);
    final typeDecorationColor = PokemonColorPicker.typeDecorationColor(selectedPokemon.primaryColor, isDarkened: true);

    return selectedPokemonSpecies.when(
      data: (pokemonSpecies) => Column(
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
                AboutTab(
                  selectedPokemon: selectedPokemon,
                  flavorTextEnglish: pokemonSpecies.flavorTextEnglish,
                ),
                const SizedBox(),
                const SizedBox(),
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
