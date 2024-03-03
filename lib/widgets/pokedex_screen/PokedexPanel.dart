import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/models/search_model.dart';
import 'package:poke_team_builder/widgets/search_autocomplete.dart';

class PokedexPanel extends StatelessWidget {
  final double width;

  PokedexPanel({super.key, required this.width});

  final DisplayController displayController = Get.find<DisplayController>();
  final SearchFilterController searchController = Get.find<SearchFilterController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: displayController.state.appSwatch.value.primary.withOpacity(0.75),
      width: width, // Fixed width for the side panel
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SearchAutocompleteField(onTapCallback: (option) {
                  searchController.changeSearchParameters(SearchModel(name: option));
                }))
          ],
        ),
      ),
    );
  }
}
