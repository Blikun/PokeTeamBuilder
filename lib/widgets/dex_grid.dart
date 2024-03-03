import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';

import 'dex_grid_item.dart';

class DexGrid extends StatelessWidget {
  final int count;

  DexGrid({super.key, required this.count});

  final searchController = Get.find<SearchFilterController>();
  final pokedexController = Get.find<PokedexController>();
  final displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final searchState = searchController.state;
      final pokedexState = pokedexController.state;
      return Column(
        children: [
          if (searchState.searchResults.value == null) ...{
            Expanded(
              child: GridView.builder(
                  controller: displayController.scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: pokedexState.index.value?.dexIndex?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: count,
                  ),
                  itemBuilder: (context, index) => DexGridItem(
                      dexEntry: pokedexState.index.value!.dexIndex![index])),
            ),
          },
          if (searchState.searchResults.value != null) ...{
            Expanded(
              child: GridView.builder(
                  controller: displayController.scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount:
                      searchState.searchResults.value?.dexIndex?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: count,
                  ),
                  itemBuilder: (context, index) => DexGridItem(
                      dexEntry:
                          searchState.searchResults.value!.dexIndex![index])),
            ),
          }
        ],
      );
    });
  }
}
