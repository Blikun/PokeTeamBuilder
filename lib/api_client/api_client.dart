import 'package:poke_team_builder/data/pokemon_index.dart';
import 'package:poke_team_builder/data/pokemon_model.dart';


abstract class ApiClient {
  Future<PokeIndex> getPokemonIndex();

  Future<PokemonModel> single(int page);

  Future<List<PokemonModel>> filterSearch(int page,);
}
