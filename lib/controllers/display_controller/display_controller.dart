
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants.dart';
import '../team_controller/team_controller.dart';

part 'display_state.dart';

class DisplayController extends GetxController {
  final DisplayState state;
  final TeamState teamState;
  DisplayController(this.state, {required this.teamState});
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // Listens to changes in searchParameters state
    ever(teamState.ownedPokemon, (_) => updateColorSwatch());
  }

  void updateColorSwatch() {
    if (teamState.ownedPokemon.value?.dexIndex == null || teamState.ownedPokemon.value!.dexIndex!.isEmpty) {
      changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.red));
      return;
    }

    final typeCounts = <PokeType, int>{};
    for (final entry in teamState.ownedPokemon.value!.dexIndex!) {
      for (final type in entry.types ?? []) {
        typeCounts[type] = (typeCounts[type] ?? 0) + 1;
      }
    }

    PokeType? dominantType;
    int maxCount = 0;
    typeCounts.forEach((type, count) {
      if (count > maxCount) {
        maxCount = count;
        dominantType = type;
      }
    });

    if (dominantType == null || maxCount == 1) {
      changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.red));
    } else {
      final colorScheme = ColorScheme.fromSwatch(primarySwatch: Constants.typeColors[dominantType] ??  Colors.red );
      changeSwatch(colorScheme);
    }
  }



  void changeSwatch(ColorScheme swatch){
    state.appSwatch.value = swatch;
    update();
  }
  
}
