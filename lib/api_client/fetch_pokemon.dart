import 'package:poke_team_builder/api_client/poke_api.dart';
import 'package:poke_team_builder/data/pokemon_index.dart';
import 'package:poke_team_builder/data/pokemon_model.dart';

class FetchData {
  final PokeApi pokeApi;
  FetchData(this.pokeApi);

  Future<PokeIndex> getPokemonIndex() async {
    return pokeApi.getPokemonIndex();
  }

  Future<PokemonModel> singlePokemon(int page) async {
    return pokeApi.single(page);
  }

  Future<List<PokemonModel>> filterSearch(int page) async {
    return pokeApi.filterSearch(page);
  }

}


  


