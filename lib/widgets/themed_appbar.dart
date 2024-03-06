import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/widgets/search_autocomplete.dart';
import 'package:poke_team_builder/widgets/themed_button.dart';

import '../controllers/display_controller/display_controller.dart';
import '../models/filter_model.dart';

AppBar themedAppBar({bool searchbar = false, bool actions = false}) {
  final DisplayController displayController = Get.find<DisplayController>();
  final FilterSearchController searchController =
      Get.find<FilterSearchController>();

  return AppBar(
    backgroundColor: displayController.state.appSwatch.value.primary,
    title: searchbar
        ? SizedBox(
            width: 250,
            height: 45,
            child: SearchAutocompleteField(onTapCallback: (option) {
              searchController
                  .changeSearchParameters(FilterModel(name: option));
            }))
        : null,
    actions: [
      if (actions)...{
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 5, top: 5),
          child: ThemedButton(
              child: IconButton(
                icon: const Icon(
                  Icons.sort_by_alpha_rounded,
                  size: 20,
                ),
                onPressed: () {
                  searchController.orderIndexAlphabetically();
                },
              )),
        ),
      Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 5, top: 5),
        child: ThemedButton(
            child: IconButton(
          icon: const Icon(
            Icons.numbers_rounded,
            size: 20,
          ),
          onPressed: () {
            searchController.orderIndexById();
          },
        )),
      )}
    ],
  );
}
