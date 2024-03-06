
part of 'navigation_controller.dart';

class NavigationState {

    /// Shown pokemons at grids
    Rx<DexEntry?> shownPokemon = Rx<DexEntry?>(null);
    /// Shown results matching criteria repository
    Rx<String> actualPage = Rx<String>("/");
}
