
part of 'pokedex_controller.dart';

/// State for pokemon indexes pokedex and generations related data
class PokedexState {

    /// Total indexed pokemon basic data repository
    final Rx<IndexModel?> indexRepository = Rx<IndexModel?>(null);

    /// Shown results matching criteria repository
    Rx<IndexModel?> shownIndex = Rx<IndexModel?>(null);

    /// Generations data repository
    final Rx<GenerationsModel?> generations = Rx<GenerationsModel>(GenerationsModel());

    /// Fetched [PokemonModel] repository
    final Rx<List<PokemonModel?>> pokedex = Rx<List<PokemonModel?>>([]);
}
