import 'package:poke_team_builder/models/generations_model.dart';

import '../models/index_model.dart';
import '../models/pokemon_model.dart';

/// API requirements interface
abstract class API {
  Future<IndexModel> pokeIndex();

  Future<PokemonModel> singlePokemon(int id);

  Future<GenerationsModel> generations();

  Future<List<PokemonModel>> pokemonListPaginated(
      int page, int count, List<String> searchParams);
}
