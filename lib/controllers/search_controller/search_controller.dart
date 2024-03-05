
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:poke_team_builder/constants.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';

import '../../models/index_model.dart';
import '../../models/filter_model.dart';

part 'search_state.dart';

class FilterSearchController extends GetxController {
  final SearchFilterState state;
  final PokedexState pokedexState;

  FilterSearchController({
    required this.state,
    required this.pokedexState,
  });

  @override
  void onInit() {
    super.onInit();
    // Listens to changes in searchParameters state
    ever(state.searchParameters, (_) => onSearchParametersChanged());
  }

  void onSearchParametersChanged() {
    log("Search Parameters Changed");
    IndexModel index = pokedexState.indexRepository.value!;
    List<DexEntry> resultList = [];

    for (DexEntry entry in index.dexIndex!) {
      bool? matchesName;
      bool? matchesType;
      if (state.searchParameters.value?.name != null) {
        matchesName = false;
        if (entry.name!.toLowerCase().contains(state.searchParameters.value!.name!)){
          matchesName = true;
        }
      }
      if (state.searchParameters.value?.pokeTypeMain != null) {
        matchesType = false;
        if(entry.types![0] == state.searchParameters.value!.pokeTypeMain){
          matchesType = true;
        }
      }
      if ((matchesName ?? true) && (matchesType ?? true)) {
        resultList.add(entry);
      }
    }
    pokedexState.shownIndex.value = IndexModel(dexIndex: resultList);
  }

  void changeSearchParameters(FilterModel newParameters) {
    FilterModel? oldParameters = state.searchParameters.value;

    PokeType? updatedPokeTypeMain = newParameters.pokeTypeMain;
    if ((newParameters.pokeTypeMain == oldParameters?.pokeTypeMain)) {
      updatedPokeTypeMain = null;
    }

    PokeType? updatedPokeTypeSub = newParameters.pokeTypeSub;
    if ((newParameters.pokeTypeSub == oldParameters?.pokeTypeSub)) {
      updatedPokeTypeSub = null;
    }

    FilterModel updatedParams = FilterModel(
      name: newParameters.name ?? oldParameters?.name,
      id: newParameters.id ?? oldParameters?.id,
      pokeTypeMain: newParameters.pokeTypeMain != null ? updatedPokeTypeMain : oldParameters?.pokeTypeMain,
      pokeTypeSub: updatedPokeTypeSub ?? oldParameters?.pokeTypeMain,
    );
    state.searchParameters.value = updatedParams;
  }

  Iterable<String> getSearchOptions(TextEditingValue textEditingValue, {required int count}) {
    IndexModel index = pokedexState.indexRepository.value!;
    List<String> optionStrings = [];
    for (DexEntry entry in index.dexIndex!) {
      if (entry.name!
          .toLowerCase()
          .contains(textEditingValue.text.toLowerCase())) {
        optionStrings.add(entry.name!);
      }
    }
    return optionStrings.take(count);
  }

  void orderIndexAlphabetically() {
    final ascending = pokedexState.shownIndex.value!.ascending;
    final dexIndex = pokedexState.shownIndex.value!.dexIndex;
    dexIndex!.sort((a, b) {
      if (ascending) {
        return a.name!.compareTo(b.name!);
      } else {
        return b.name!.compareTo(a.name!);
      }
    });
    pokedexState.shownIndex.value = IndexModel(dexIndex: dexIndex, ascending: !ascending);
    update();
  }

  void orderIndexById() {
    final ascending = pokedexState.shownIndex.value!.ascending;
    final dexIndex = pokedexState.shownIndex.value!.dexIndex;
    if (ascending) {
      dexIndex!.sort((a, b) => a.id.compareTo(b.id));
    } else {
      dexIndex!.sort((a, b) => b.id.compareTo(a.id));
    }
    pokedexState.shownIndex.value = IndexModel(dexIndex: dexIndex, ascending: !ascending);
    update(); // Notify listeners about the update
  }

}
