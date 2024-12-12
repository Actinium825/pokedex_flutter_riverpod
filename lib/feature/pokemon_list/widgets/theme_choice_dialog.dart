import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

class ThemeChoiceDialog extends StatelessWidget {
  const ThemeChoiceDialog({
    required this.savedThemeMode,
    required this.onSelectTheme,
    super.key,
  });

  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode?> onSelectTheme;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text(chooseThemeMenuLabel),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: ThemeMode.values.map(
          (themeMode) {
            return RadioListTile(
              title: Text(themeMode.name.capitalize()),
              value: themeMode,
              groupValue: savedThemeMode,
              onChanged: onSelectTheme,
            );
          },
        ).toList(),
      ),
    );
  }
}
