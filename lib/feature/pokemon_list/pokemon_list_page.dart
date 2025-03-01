import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/pokemon_info_page.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/infinite_list.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/list_scaffold.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/search_field.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_list_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/search_text_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_theme_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/const.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({super.key});

  static const route = '/';

  @override
  ConsumerState<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
  late final ScrollController _scrollController;
  late final TextEditingController _textEditingController;
  late final ValueNotifier<bool> _isSearchingNotifier;
  Timer? _debouncer;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onReachEnd);
    _textEditingController = TextEditingController()..addListener(_onUpdateText);
    _isSearchingNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _isSearchingNotifier.dispose();
    super.dispose();
  }

  void _showThemeChoiceDialog() => showDialog<void>(
        context: context,
        builder: (_) => ThemeChoiceDialog(
          savedThemeMode: ref.read(selectedThemeProvider),
          onSelectTheme: _onSelectTheme,
        ),
      );

  void _onSelectOption(String option) {
    if (option == chooseThemeMenuLabel) _showThemeChoiceDialog();
  }

  void _onSelectTheme(ThemeMode? themeMode) {
    ref.read(selectedThemeProvider.notifier).changeThemeMode(themeMode ?? ThemeMode.system);
    context.pop();
  }

  void _onReachEnd() {
    final position = _scrollController.position;
    if (position.pixels == position.maxScrollExtent) ref.read(pokemonListProvider.notifier).getMorePokemon();
  }

  void _onPressSearch() {
    _isSearchingNotifier.value = !_isSearchingNotifier.value;
    _onClearText();
  }

  void _onUpdateText() {
    _debouncer?.cancel();
    _debouncer = Timer(
      debouncerDelayInMilliseconds.milliseconds,
      () => ref.read(searchTextProvider.notifier).state = _textEditingController.text,
    );
  }

  Future<void> _onRefresh() async {
    _onClearText();
    if (_isSearchingNotifier.value) _isSearchingNotifier.value = false;
    ref.read(pokemonListProvider.notifier).initPokemonListPage();
  }

  void _onClearText() {
    if (_textEditingController.text.isNotEmpty) _textEditingController.clear();
  }

  void _onTapPokemonCard(PokemonDto selectedPokemon) {
    ref.watch(selectedPokemonProvider.notifier).state = selectedPokemon;
    context.pushNamed(PokemonInfoPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      appBarLeading: ValueListenableBuilder<bool>(
        valueListenable: _isSearchingNotifier,
        builder: (_, isSearching, __) => isSearching
            ? SearchField(textEditingController: _textEditingController)
            : Text(
                appTitle,
                style: context.textTheme.displayMedium,
              ),
      ),
      appBarActions: [
        IconButton(
          onPressed: _onPressSearch,
          icon: ValueListenableBuilder<bool>(
            valueListenable: _isSearchingNotifier,
            builder: (_, isSearching, __) => Icon(isSearching ? Icons.close : Icons.search),
          ),
        ),
        IconButton(
          onPressed: _onRefresh,
          icon: const Icon(Icons.refresh),
        ),
        PopupMenuButton(
          onSelected: _onSelectOption,
          itemBuilder: (_) => [chooseThemeMenuLabel].map(
            (choice) {
              return PopupMenuItem(
                value: choice,
                child: Text(choice),
              );
            },
          ).toList(),
        ),
      ],
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Padding(
          padding: pokemonListPagePadding,
          child: InfiniteList(
            scrollController: _scrollController,
            onTapPokemonCard: _onTapPokemonCard,
          ),
        ),
      ),
    );
  }
}
