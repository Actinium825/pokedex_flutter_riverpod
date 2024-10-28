import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/providers/shared_preferences_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_theme_provider.g.dart';

@riverpod
class SelectedTheme extends _$SelectedTheme {
  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final themeModeIndex = prefs.getInt(themeSharedPrefsKey) ?? ThemeMode.system.index;

    return ThemeMode.values.elementAt(themeModeIndex);
  }

  void changeThemeMode(ThemeMode selectedThemeMode) {
    state = selectedThemeMode;

    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setInt(themeSharedPrefsKey, state.index);
  }
}
