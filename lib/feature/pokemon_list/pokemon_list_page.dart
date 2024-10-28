import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/list_scaffold.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_theme_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({super.key});

  static const route = '/';

  @override
  ConsumerState<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
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

  @override
  Widget build(BuildContext context) {
    return ListScaffold(
      appBarLeading: Text(
        appTitle,
        style: context.textTheme.displayMedium,
      ),
      appBarActions: [
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
      body: const SizedBox(),
    );
  }
}
