import 'package:poke_team_builder/api_client/api_pokeapi.dart';
import 'package:poke_team_builder/models/generations_model.dart';

import '../models/index_model.dart';
import '../models/pokemon_model.dart';


/// API client manager can extend an [API] implementation
class ApiClient extends PokeApi{

  Future<IndexModel> getIndex(Gen gen) async {
    return super.pokeIndex(gen);
  }

  Future<GenerationsModel> getGenerations() async {
    return super.generations();
  }

  Future<int> getGenerationCount(generationId) async {
    return super.getCountForGeneration(generationId);
  }

  Future<PokemonModel> getSinglePokemon(int page) async {
    return super.singlePokemon(page);
  }

}


  


