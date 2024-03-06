import 'package:poke_team_builder/models/generations_model.dart';

import '../models/index_model.dart';
import '../models/pokemon_model.dart';

/// API requirements interface
abstract class API {
  Future<IndexModel> getPokeIndex(Gen gen);

  Future<PokemonModel> getSinglePokemonDetails(int id);

  Future<GenerationsModel> getGamesGenerations();

  Future<List<PokemonModel>> pokemonListPaginated(
      int page, int count, List<String> searchParams);
}
