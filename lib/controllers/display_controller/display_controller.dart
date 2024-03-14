import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../models/dex_entry_model.dart';
import '../team_controller/team_controller.dart';

part 'display_state.dart';

/// Display and Theme related use-cases
class DisplayController extends GetxController {
  final DisplayState state;
  final TeamState teamState;

  DisplayController(this.state, this.teamState);

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // Listens to changes in ownedPokemon state
    ever(teamState.ownedPokemon, (_) => updateColorSwatch());
  }

  //Many pokemon are two typed, example:
  //Selecting Ivysaur alone wont trigger a change because its Two typed, 1Poison 1Grass
  //Selecting Ivysaur + Ekans will trigger poison change
  void updateColorSwatch() {
    if (teamState.ownedPokemon.value?.dexIndex == null ||
        teamState.ownedPokemon.value!.dexIndex!.isEmpty) {
      changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.red));
      return;
    }

    Map<PokeType, int> recordchart = {};
    for (DexEntry entry in teamState.ownedPokemon.value!.dexIndex!) {
      for (PokeType type in entry.types!) {
        recordchart.update(type, ifAbsent: () => 1, (value) => value + 1);
      }
    }

    int topRecord = 0;
    PokeType? predominant;
    bool isDraw = false;

    for (var recordEntry in recordchart.entries) {
      if (recordEntry.value > topRecord) {
        topRecord = recordEntry.value;
        predominant = recordEntry.key;
        isDraw = false;
      } else if (recordEntry.value == topRecord) {
        predominant = null;
        isDraw = true;
      }
    }

    if (!isDraw && predominant != null) {
      // wins only if alone
      final colorScheme = ColorScheme.fromSwatch(
          primarySwatch: Constants.typeColors[predominant]!);
      changeSwatch(colorScheme);
    } else {
      // If there are no record alone, no one wins
      changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.red));
    }
  }

  void changeSwatch(ColorScheme swatch) {
    state.appSwatch.value = swatch;
    update();
  }
}
