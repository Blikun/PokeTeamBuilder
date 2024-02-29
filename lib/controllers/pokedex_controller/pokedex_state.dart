
part of 'pokedex_controller.dart';

class PokedexState {

    /// Indexed pokemon names plus count repository
    final Rx<PokeIndex?> index = Rx<PokeIndex?>(null);
    /// Fetched [PokemonModel] repository
    final Rx<List<PokemonModel?>> pokedex = Rx<List<PokemonModel?>>([]);


    final Rx<String?> name = Rx<String?>(null);



}
