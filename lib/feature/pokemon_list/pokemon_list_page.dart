import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/list_scaffold.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list/widgets/theme_choice_dialog.dart';
import 'package:pokedex_flutter_riverpod/utils/extension.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  static const route = '/';

  void _showThemeChoiceDialog(BuildContext context) => showDialog<void>(
        context: context,
        builder: (_) => ThemeChoiceDialog(
          // TODO: Update value
          savedThemeMode: ThemeMode.system,
          // TODO: Update function
          onSelectTheme: (_) => context.pop(),
        ),
      );

  void _onSelectOption(BuildContext context, String option) {
    if (option == chooseThemeMenuLabel) _showThemeChoiceDialog(context);
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
          onSelected: (value) => _onSelectOption(context, value),
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
