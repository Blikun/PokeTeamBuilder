import 'dart:developer';

import 'package:get/get.dart';
import 'package:poke_team_builder/api_client/api_client.dart';

import '../../models/pokemon_index.dart';
import '../../models/pokemon_model.dart';

part 'pokedex_state.dart';

class PokedexController extends GetxController {
  final PokedexState state;
  final ApiClient apiClient;
  PokedexController(this.apiClient, this.state);

  @override
  void onInit() {
    getIndex();
    super.onInit();
  }

  void getIndex() async {
    PokeIndex pokeIndex = await apiClient.pokeIndex();
    state.index.value = pokeIndex;
    log("Indexed ${state.index.value!.count} pokemon");
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
  }
}
