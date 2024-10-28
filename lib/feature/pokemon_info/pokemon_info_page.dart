import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/classes/pokemon_color_picker.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/info_scaffold.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:pokedex_flutter_riverpod/widgets/pokemon_image.dart';
import 'package:pokedex_flutter_riverpod/widgets/pokemon_type_list.dart';

class PokemonInfoPage extends ConsumerWidget {
  const PokemonInfoPage({super.key});

  static const route = 'pokemon-info';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPokemon = ref.read(selectedPokemonProvider);
    final primaryColor = selectedPokemon.primaryColor;
    final textTheme = context.textTheme;
    final themeData = context.themeData;
    final typeDecorationColor = PokemonColorPicker.typeDecorationColor(primaryColor, isDarkened: true);

    return InfoScaffold(
      color: primaryColor,
      children: [
        Padding(
          padding: infoPageHeaderPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedPokemon.capitalizedNamed,
                style: textTheme.displayLarge,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  selectedPokemon.formatId(),
                  style: textTheme.displaySmall,
                ),
              ),
              PokemonTypeList(
                pokemon: selectedPokemon,
                isDecorationShown: true,
              ),
              Expanded(
                flex: context.isPortrait ? 0 : 1,
                child: PokemonImage(
                  pokemon: selectedPokemon,
                  size: infoPageImageSize,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: infoPageModalPadding,
            decoration: BoxDecoration(
              color: themeData.primaryColor,
              borderRadius: infoPageModalRadius,
            ),
            child: DefaultTabController(
              length: tabLabels.length,
              child: Column(
                children: [
                  TabBar(
                    labelColor: typeDecorationColor,
                    indicatorColor: typeDecorationColor,
                    unselectedLabelColor: themeData.unselectedWidgetColor,
                    tabs: tabLabels.map((tabLabel) => Tab(text: tabLabel)).toList(),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
