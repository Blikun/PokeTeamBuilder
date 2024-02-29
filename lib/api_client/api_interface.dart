import '../models/pokemon_index.dart';
import '../models/pokemon_model.dart';

/// API requirements interface
abstract class API {
  Future<PokeIndex> pokeIndex();

  Future<PokemonModel> singlePokemon(int id);

  Future<List<PokemonModel>> pokemonListPaginated(
      int page, int count, List<String> searchParams);
}
