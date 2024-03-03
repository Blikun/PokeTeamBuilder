import '../models/index_model.dart';
import '../models/pokemon_model.dart';

/// API requirements interface
abstract class API {
  Future<IndexModel> pokeIndex();

  Future<PokemonModel> singlePokemon(int id);

  Future<List<PokemonModel>> pokemonListPaginated(
      int page, int count, List<String> searchParams);
}
