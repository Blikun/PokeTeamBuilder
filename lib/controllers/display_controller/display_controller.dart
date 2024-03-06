import 'dart:io' show Platform;
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
    // Listens to changes in ownedPokemon state
    ever(teamState.ownedPokemon, (_) => updateColorSwatch());
  }

  void updateColorSwatch() {
    if (teamState.ownedPokemon.value?.dexIndex == null ||
        teamState.ownedPokemon.value!.dexIndex!.isEmpty) {
      changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.red));
      return;
    }

    final typeMaxFoundMap = <PokeType, int>{};
    for (final entry in teamState.ownedPokemon.value!.dexIndex!) {
      for (final type in entry.types ?? []) {
        typeMaxFoundMap[type] = (typeMaxFoundMap[type] ?? 0) + 1;
      }
    }

    // Determine the maximum over all
    int record = 0;
    typeMaxFoundMap.forEach((type, maxForTheType) {
      if (maxForTheType > record) {
        record = maxForTheType;
      }
    });

    // Find all types that have the record value
    final List<PokeType> typesWithRecord = typeMaxFoundMap.entries
        .where((entry) => entry.value == record)
        .map((entry) => entry.key)
        .toList();

    if (typesWithRecord.length == 1) {
      // wins only if alone

      var colorScheme = ColorScheme.fromSwatch(
          primarySwatch:
              Constants.typeColors[typesWithRecord.first] ?? Colors.red);
      if (isMobile()) {
         colorScheme = ColorScheme.fromSeed(
            seedColor:
                Constants.typeColors[typesWithRecord.first] ?? Colors.red);
      }

      changeSwatch(colorScheme);
    } else {
      // If there are no record alone, no one wins
      changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.red));
      if (isMobile()) {
        changeSwatch(ColorScheme.fromSeed(seedColor: Colors.red));
      }
    }
  }

  bool isMobile() {
    if (Platform.isIOS || Platform.isAndroid) {
      return true;
    }
    return false;
  }

  void changeSwatch(ColorScheme swatch) {
    state.appSwatch.value = swatch;
    update();
  }
}
