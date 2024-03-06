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
    if (state.indexRepository.value == null) initializeDex();
    super.onInit();
  }

  void initializeDex() async {
    int startingGen = 1; // default at gen 1
    GenerationsModel generations = await getGenerations();
    getIndex(generations.genList![startingGen - 1]);
  }

  void getIndex(Gen gen) async {
    state.generations.value!.genList![gen.number! - 1] =
        await updateNeededGensCount(gen);
    IndexModel pokeIndex = await apiClient.pokeIndex(gen);
    state.indexRepository.value?.dexIndex == null
        ? state.indexRepository.value = pokeIndex
        : state.indexRepository.value!.dexIndex!
            .addAll(pokeIndex.dexIndex!.toList());
    state.shownIndex.value = pokeIndex;
    log("Indexed ${state.indexRepository.value!.dexIndex!.length} pokemon");
    indexToPokedex(pokeIndex);
    update();
  }

  Future<GenerationsModel> getGenerations() async {
    GenerationsModel generations = await apiClient.generations();
    state.generations.value = generations;
    log("got generations");
    return generations;
  }

  Future<Gen> updateNeededGensCount(Gen gen) async {
    if (gen.count == null || gen.offset == null) {
      int count = await apiClient.getCountForGeneration(gen.number!);
      int offset = 0;
      for (int prevGenCount = gen.number! - 1;
          prevGenCount >= 1;
          prevGenCount--) {
        int pastCount = await apiClient.getCountForGeneration(prevGenCount);
        offset = offset + pastCount;
        state.generations.value!.genList![prevGenCount].count = pastCount;
        state.generations.value!.genList![prevGenCount].offset = offset;
      }
      gen.count = count;
      gen.offset = offset;
    }
    return gen;
  }

  void indexToPokedex(IndexModel pokeIndex) {
    List<PokemonModel> pokemonModelList = [];
    for (var indexEntry in pokeIndex.dexIndex!) {
      PokemonModel pokemonModel = PokemonModel(
          id: indexEntry.id, name: indexEntry.name, types: indexEntry.types);
      pokemonModelList.add(pokemonModel);
    }
    updatePokedex(pokemonModelList);
    log("filling pokedex");
  }

  void updateShownPokemon(IndexModel pokeIndex) {
    state.shownIndex.value = pokeIndex;
    log("updated shown pokemon index");
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

  void getPokemonDetails(DexEntry dexEntry) async {
    PokemonModel updatedPokemon = await apiClient.getSinglePokemon(dexEntry.id);
    int indexAtPokedex =
        state.pokedex.value.indexWhere((pokemon) => pokemon?.id == dexEntry.id);

    if (indexAtPokedex != -1) {
      state.pokedex.value[indexAtPokedex] = updatedPokemon;
    } else {
      state.pokedex.value.add(updatedPokemon);
    }
    state.pokedex.refresh();
  }
}
