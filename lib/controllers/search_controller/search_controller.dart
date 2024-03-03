
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';

import '../../models/index_model.dart';
import '../../models/search_model.dart';

part 'search_state.dart';

class SearchFilterController extends GetxController {
  final SearchFilterState state;
  final PokedexController pokedexController;

  SearchFilterController({
    required this.state,
    required this.pokedexController,
  });

  @override
  void onInit() {
    super.onInit();
    // Listens to changes in searchParameters
    ever(state.searchParameters, (_) => onSearchParametersChanged());
  }

  void onSearchParametersChanged() {
    log("Search Parameters Changed");
    IndexModel index = pokedexController.state.index.value!;
    List<DexEntry> resultList = [];
    for (DexEntry entry in index.dexIndex!) {
      if (entry.name!
          .toLowerCase()
          .contains(state.searchParameters.value!.name!)) {
        resultList.add(entry);
      }
    }
    state.searchResults.value = IndexModel(dexIndex: resultList);
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

  void changeSearchParameters(SearchModel parameters) {
    SearchModel? currentParams = state.searchParameters.value;

    SearchModel updatedParams = SearchModel(
      name: parameters.name ?? currentParams?.name,
      id: parameters.id ?? currentParams?.id,
      pokeTypeMain: parameters.pokeTypeMain ?? currentParams?.pokeTypeMain,
      pokeTypeSub: parameters.pokeTypeSub ?? currentParams?.pokeTypeSub,
    );

    state.searchParameters.value = updatedParams;
  }

}
