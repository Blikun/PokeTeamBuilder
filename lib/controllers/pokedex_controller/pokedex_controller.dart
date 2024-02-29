import 'package:get/get.dart';

import '../../models/pokemon_index.dart';
import '../../models/pokemon_model.dart';



part 'pokedex_state.dart';

class PokedexController extends GetxController {
  final PokedexState state = PokedexState();

  void updatePokedex(List<PokemonModel?> newPokemons) {
    final pokedex = state.pokedex.value;
    for (var newPokemon in newPokemons) {
      bool exists = pokedex.any((existingPokemon) => existingPokemon!.id == newPokemon!.id);
      if (!exists) {
        pokedex.add(newPokemon);
      }
    }
  }

  void updateName(String? newValue) {
    var name;
    if (name.value == newValue) {
      name.value = null;
    } else {
      name.value = newValue;
    }
  }
}
