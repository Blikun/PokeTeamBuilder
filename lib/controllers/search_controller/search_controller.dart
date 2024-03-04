
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';

import '../../models/index_model.dart';
import '../../models/search_model.dart';

part 'search_state.dart';

class FilterSearchController extends GetxController {
  final SearchFilterState state;
  final PokedexController pokedexController;

  FilterSearchController({
    required this.state,
    required this.pokedexController,
  });

  @override
  void onInit() {
    super.onInit();
    // Listens to changes in searchParameters state
    ever(state.searchParameters, (_) => onSearchParametersChanged());
  }

  void onSearchParametersChanged() {
    log("Search Parameters Changed");
    IndexModel index = pokedexController.state.index.value!;
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
    state.searchResults.value = IndexModel(dexIndex: resultList);
  }

  void changeSearchParameters(SearchModel newParameters) {
    SearchModel? oldParameters = state.searchParameters.value;

    SearchModel updatedParams = SearchModel(
      name: newParameters.name ?? oldParameters?.name,
      id: newParameters.id ?? oldParameters?.id,
      pokeTypeMain: newParameters.pokeTypeMain ?? oldParameters?.pokeTypeMain,
      pokeTypeSub: newParameters.pokeTypeSub ?? oldParameters?.pokeTypeSub,
    );
    state.searchParameters.value = updatedParams;
  }

  Iterable<String> getSearchOptions(TextEditingValue textEditingValue, {required int count}) {
    IndexModel index = pokedexController.state.index.value!;
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
}
