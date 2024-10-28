import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_theme_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/router.dart';
import 'package:pokedex_flutter_riverpod/utils/themes.dart';

class PokedexApp extends ConsumerWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(selectedThemeProvider),
      theme: PokedexTheme.themeRegular,
      darkTheme: PokedexTheme.themeDark,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
