import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/models/filter_model.dart';
import 'package:poke_team_builder/widgets/pokedex_screen/types_filter_wrap.dart';
import 'package:poke_team_builder/widgets/search_autocomplete.dart';

/// Static panel widget only for Tablet to Desktop sizes
class PokedexPanel extends StatelessWidget {
  final double width;
  final bool mobile;
  PokedexPanel({super.key, required this.width, this.mobile = false});

  final DisplayController displayController = Get.find<DisplayController>();
  final FilterSearchController searchController =
      Get.find<FilterSearchController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: displayController.state.appSwatch.value.primary.withOpacity(0.75),
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 50,
                  child: SearchAutocompleteField(onTapCallback: (option) {
                    searchController
                        .changeSearchParameters(FilterModel(name: option));
                  }),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Type filter",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Divider(),
                TypesFilterWrap(size: 50),
                const Divider(
                  endIndent: 60,
                  indent: 60,
                ),
              ],
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
