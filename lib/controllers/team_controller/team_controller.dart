import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/local_data_controller/local_data_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import '../../models/dex_entry_model.dart';
import '../../models/index_model.dart';
import '../../widgets/themed_snackbar.dart';

part 'team_state.dart';

/// Captured or teamed pokemon use-cases
class TeamController extends GetxController {
  final TeamState state;
  final LocalDataController localDataController;
  final GetStorage box = GetStorage();

  TeamController(this.state, this.localDataController);

  @override
  void onInit() {
    Future.delayed(1.seconds,(){
      loadOwnedPokemon();
    });
    super.onInit();
  }

  void loadOwnedPokemon() {
   final loadedTeamData = localDataController.loadTeamData();
   if (loadedTeamData != null) {
     DisplayController displayController = Get.find<DisplayController>();
     state.ownedPokemon.value = loadedTeamData;
     state.ownedPokemon.refresh();
     displayController.updateColorSwatch();
     themedSnackbar(
         title: "Captured pokemons loaded",
         msg:
             "Loaded ${state.ownedPokemon.value?.dexIndex?.length} pokemons from your past session");
   }
  }

  void saveOwnedPokemon() {
    final currentTeamData = state.ownedPokemon.value;
    if (currentTeamData != null) {
      localDataController.saveTeamData(currentTeamData);
    }
  }

  void addToOwned(DexEntry dexEntry) {
    IndexModel? ownedPokemons = state.ownedPokemon.value;

    final exists =
        ownedPokemons?.dexIndex?.any((entry) => entry.id == dexEntry.id) ??
            false;

    if (exists) {
      log("${dexEntry.name} is already owned");
      return;
    }

    if (ownedPokemons != null) {
      ownedPokemons.dexIndex!.add(dexEntry);
    } else {
      ownedPokemons = IndexModel(dexIndex: [dexEntry]);
    }

    log("${dexEntry.name} added to owned");
    state.ownedPokemon.value = ownedPokemons;
    state.ownedPokemon.refresh();
    saveOwnedPokemon();
  }

  void removeFromOwned(DexEntry dexEntry) {
    FilterSearchController searchController =
        Get.find<FilterSearchController>();
    IndexModel? ownedPokemons = state.ownedPokemon.value;

    if (ownedPokemons != null) {
      ownedPokemons.dexIndex!.removeWhere((entry) => entry.id == dexEntry.id);
      log("${dexEntry.name} removed from owned");

      state.ownedPokemon.value = ownedPokemons;
      state.ownedPokemon.refresh();
      saveOwnedPokemon();
      searchController.onSearchParametersChanged();
    }
  }
}
