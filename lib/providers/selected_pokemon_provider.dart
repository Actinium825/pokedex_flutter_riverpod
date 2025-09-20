import 'package:flutter_riverpod/legacy.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';

final selectedPokemonProvider = StateProvider.autoDispose((_) => const PokemonDto());
