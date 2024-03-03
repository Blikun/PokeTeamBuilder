import 'dart:developer';

import 'package:get/get.dart';
import 'package:poke_team_builder/api_client/api_client.dart';
import 'package:poke_team_builder/models/generations_model.dart';

import '../../models/index_model.dart';
import '../../models/pokemon_model.dart';

part 'pokedex_state.dart';

class PokedexController extends GetxController {
  final PokedexState state;
  final ApiClient apiClient;
  PokedexController(this.apiClient, this.state);

  @override
  void onInit() {
    initializeDex();
    super.onInit();
  }



  void initializeDex() async {
    GenerationsModel generations = await getGenerations();
    getIndex(generations.gen!.first);
  }

  void getIndex(Gen gen) async {
    IndexModel pokeIndex = await apiClient.pokeIndex();
    state.index.value = pokeIndex;
    log("Indexed ${state.index.value!.dexIndex!.length} pokemon");
    indexToPokedex(pokeIndex);
    update();
  }

  Future<GenerationsModel> getGenerations() async {
    GenerationsModel generations = await apiClient.generations();
    state.generations.value = generations;
    log("got generations");
    return generations;
  }

  void indexToPokedex(IndexModel pokeIndex){
    List<PokemonModel> pokemonModelList = [];
    for (var indexEntry in pokeIndex.dexIndex!) {
      PokemonModel pokemonModel = PokemonModel(id: indexEntry.id, name: indexEntry.name, types: indexEntry.types);
      pokemonModelList.add(pokemonModel);
    }
    updatePokedex(pokemonModelList);
    log("filling pokedex");
  }

  void updatePokedex(List<PokemonModel?> newPokemons) {
    final pokedex = state.pokedex.value;
    for (var newPokemon in newPokemons) {
      bool exists = pokedex
          .any((existingPokemon) => existingPokemon!.id == newPokemon!.id);
      if (!exists) {
        pokedex.add(newPokemon);
      }
    }
    state.pokedex.value = pokedex;
  }
}
