import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_list_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routes: [
    GoRoute(
      path: PokemonListPage.route,
      builder: (_, __) => const PokemonListPage(),
    ),
  ],
  initialLocation: PokemonListPage.route,
  debugLogDiagnostics: kDebugMode,
  errorBuilder: (_, __) => const PokemonListPage(),
  observers: [routeObserver],
  navigatorKey: navigatorKey,
);

final routeObserver = RouteObserver<ModalRoute<void>>();
