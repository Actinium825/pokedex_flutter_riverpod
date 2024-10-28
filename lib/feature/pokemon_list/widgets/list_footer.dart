import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/providers/loading_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:pokedex_flutter_riverpod/widgets/loading_indicator.dart';

class ListFooter extends ConsumerWidget {
  const ListFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGettingMorePokemon = ref.watch(loadingProvider) == getMorePokemonKey;

    if (isGettingMorePokemon) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: progressIndicatorFooterPadding,
          child: LoadingIndicator(),
        ),
      );
    } else {
      return const SliverToBoxAdapter(child: SizedBox(height: pokemonListPageFooterHeight));
    }
  }
}
