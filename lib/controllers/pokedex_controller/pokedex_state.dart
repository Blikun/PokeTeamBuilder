
part of 'pokedex_controller.dart';

class PokedexState {

    /// Indexed pokemon names plus count repository
    final Rx<IndexModel?> index = Rx<IndexModel?>(null);
    /// Fetched [PokemonModel] repository
    final Rx<List<PokemonModel?>> pokedex = Rx<List<PokemonModel?>>([]);

}
