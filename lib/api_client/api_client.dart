import 'package:poke_team_builder/api_client/api_pokeapi.dart';
import 'package:poke_team_builder/models/generations_model.dart';

import '../models/index_model.dart';
import '../models/pokemon_model.dart';


/// API client manager can extend an [API] implementation
class ApiClient extends PokeApi{

  Future<IndexModel> getIndex() async {
    return super.pokeIndex();
  }

  Future<GenerationsModel> getGenerations() async {
    return super.generations();
  }

  Future<PokemonModel> getSinglePokemon(int page) async {
    return super.singlePokemon(page);
  }

}


  


