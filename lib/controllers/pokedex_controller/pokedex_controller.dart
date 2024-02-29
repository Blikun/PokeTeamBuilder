
import 'package:get/get.dart';

import '../../data/pokemon_index.dart';
import '../../data/pokemon_model.dart';

part 'pokedex_state.dart';

class DexControllerLogic extends GetxController {
  final DexControllerState state = DexControllerState();

  void updatePokedex(Rx<List<PokemonModel?>> pokemons) {
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
