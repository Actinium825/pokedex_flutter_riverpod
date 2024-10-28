import 'package:flutter/material.dart';
import 'package:pokedex_flutter_riverpod/utils/router.dart';
import 'package:pokedex_flutter_riverpod/utils/themes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: PokedexTheme.themeRegular,
      darkTheme: PokedexTheme.themeDark,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
