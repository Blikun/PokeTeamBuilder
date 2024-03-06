import 'package:poke_team_builder/api_client/api_pokeapi.dart';
import 'package:poke_team_builder/models/generations_model.dart';

import '../models/index_model.dart';
import '../models/pokemon_model.dart';


/// API client use-cases called from controllers
/// this class can extend any [API] interface implementation
class ApiClient extends PokeApi{

  Future<IndexModel> getIndex(Gen gen) async {
    return super.getPokeIndex(gen);
  }

  Future<GenerationsModel> getGenerations() async {
    return super.getGamesGenerations();
  }

  Future<int> getGenerationCount(generationId) async {
    return super.getCountForGeneration(generationId);
  }

  Future<PokemonModel> getSinglePokemon(int id) async {
    return super.getSinglePokemonDetails(id);
  }

}


  


