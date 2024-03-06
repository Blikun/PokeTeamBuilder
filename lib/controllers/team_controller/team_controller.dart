import 'dart:developer';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import '../../models/dex_entry_model.dart';
import '../../models/index_model.dart';

part 'team_state.dart';

/// Captured / Teamed Pokemon use-cases
class TeamController extends GetxController {
  final TeamState state;

  TeamController(this.state);

  @override
  void onInit() {
    // initializeTeam();
    super.onInit();
  }

    // void initializeTeam() async {
    //
    // }

  void addToOwned(DexEntry dexEntry) {
    IndexModel? ownedPokemons = state.ownedPokemon.value;

    if (ownedPokemons != null) {
      if (ownedPokemons.dexIndex!.any((entry) => entry.id == dexEntry.id)) {
        log("${dexEntry.name} is already in the list of owned Pokemon");
      } else {
        ownedPokemons.dexIndex!.add(dexEntry);
        log("${dexEntry.name} added to owned pokemon");
      }
    } else {
      ownedPokemons = IndexModel(dexIndex: [dexEntry]);
      log("${dexEntry.name} added to owned pokemon");
    }
    state.ownedPokemon.value = ownedPokemons;
    state.ownedPokemon.refresh();
  }

  void removeFromOwned(DexEntry dexEntry) {
    FilterSearchController searchController = Get.find<FilterSearchController>();
    IndexModel? ownedPokemons = state.ownedPokemon.value;

    if (ownedPokemons != null) {
      ownedPokemons.dexIndex!.removeWhere((entry) => entry.id == dexEntry.id);
      log("${dexEntry.name} removed from owned pokemon");

      state.ownedPokemon.value = ownedPokemons;
      state.ownedPokemon.refresh();
      searchController.onSearchParametersChanged();
    } else {
      log("Error");
    }
  }

}
