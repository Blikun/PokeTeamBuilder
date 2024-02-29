import 'package:poke_team_builder/api_client/api_pokeapi.dart';

import '../models/pokemon_index.dart';
import '../models/pokemon_model.dart';


/// API client manager can extend an [API] implementation
class ApiClient extends PokeApi{

  ApiClient(super.dio);

  Future<PokeIndex> getIndex() async {
    return super.pokeIndex();
  }

  Future<PokemonModel> getSinglePokemon(int page) async {
    return super.singlePokemon(page);
  }

  Future<List<PokemonModel>> getPokedexPaginated(int page, int count) async {
    List<String> searchParams = [];

    return super.pokemonListPaginated(page, count, searchParams);
  }

}


  


