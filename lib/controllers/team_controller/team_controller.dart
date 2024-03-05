
import 'package:get/get.dart';
import '../../models/pokemon_model.dart';

part 'team_state.dart';

class TeamController extends GetxController {
  final TeamState state;

  TeamController(this.state);

  void updateOwnedPokemons(List<PokemonModel?> newPokemons) {
    final pokedex = state.ownedPokemons.value;
    for (var newPokemon in newPokemons) {
      bool exists = pokedex
          .any((existingPokemon) => existingPokemon!.id == newPokemon!.id);
      if (!exists) {
        pokedex.add(newPokemon);
      }
    }
    state.ownedPokemons.value = pokedex;
  }
}
