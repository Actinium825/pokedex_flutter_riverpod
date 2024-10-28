import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/classes/adaptive_stateless_widget.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

class ThemeChoiceDialog extends AdaptiveStatelessWidget {
  const ThemeChoiceDialog({
    required this.savedThemeMode,
    required this.onSelectTheme,
    super.key,
  });

  final ThemeMode savedThemeMode;
  final ValueChanged<ThemeMode?> onSelectTheme;

  @override
  Widget buildAndroid(BuildContext context) {
    return AlertDialog(
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

  @override
  Widget buildIos(BuildContext context) {
    return CupertinoAlertDialog(
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
