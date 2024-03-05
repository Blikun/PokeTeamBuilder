
part of 'team_controller.dart';

class TeamState {

    /// owned [PokemonModel] repository
    final Rx<List<PokemonModel?>> ownedPokemons = Rx<List<PokemonModel?>>([]);
}
