
part of 'navigation_controller.dart';

/// State for navigation
class NavigationState {

    /// Pokemon to load when navigation to details
    Rx<DexEntry?> shownPokemon = Rx<DexEntry?>(null);
    /// Actual nav route
    Rx<String> actualPage = Rx<String>("/");
}
