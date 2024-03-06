import 'dart:developer';

import 'package:get/get.dart';

import '../../models/index_model.dart';

part 'team_state.dart';

class TeamController extends GetxController {
  final TeamState state;

  TeamController(this.state);

  @override
  void onInit() {
    //if (state.ownedPokemon.value == null) initializeTeam();
    super.onInit();
  }

  void initializeTeam() async {

  }

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

}
