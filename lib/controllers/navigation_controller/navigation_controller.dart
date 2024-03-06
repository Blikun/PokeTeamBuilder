import 'dart:developer';

import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/team_controller/team_controller.dart';
import 'package:poke_team_builder/models/index_model.dart';
import 'package:poke_team_builder/screens/owned_screen.dart';
import 'package:poke_team_builder/screens/pokedex_screen.dart';
import '../../screens/details_screen.dart';
import '../pokedex_controller/pokedex_controller.dart';

part 'navigation_state.dart';

class NavigationController extends GetxController {
  final NavigationState state;
  final PokedexController pokedexController;
  final TeamController teamController;

  NavigationController(this.state, this.pokedexController, this.teamController);

  void showDetailsScreen(DexEntry dexEntry) async {
    state.shownPokemon.value = pokedexController
        .state.indexRepository.value!.dexIndex!
        .firstWhere((pokemon) => pokemon.id == dexEntry.id);
    pokedexController.getPokemonDetails(dexEntry);
    Get.to(
      () => DetailsScreen(),
    );
  }

  void showOwnedScreen() async {
    Get.to(
      () => OwnedScreen(),
    );
  }

  void showPokedexScreen() async {
    Get.to(
      () => PokedexScreen(),
    );
  }

  void changeActualPage(String pageRoute) {
    state.actualPage.value = pageRoute;
    switch (pageRoute) {
      case "/OwnedScreen":
        pokedexController.updateShownPokemon(teamController.state.ownedPokemon.value!);
        break;
      default:
        pokedexController.updateShownPokemon(pokedexController.state.indexRepository.value ?? IndexModel());
    }
    log("actual route: $pageRoute");
  }
}
