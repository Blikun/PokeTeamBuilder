import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/models/index_model.dart';

import 'dex_grid_item.dart';

class DexGrid extends StatelessWidget {
  final int count;
  final Function(DexEntry selectedEntry) onItemTap;

  DexGrid({super.key, required this.count, required this.onItemTap});

  final searchController = Get.find<FilterSearchController>();
  final pokedexController = Get.find<PokedexController>();
  final displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pokedexState = pokedexController.state;
      return Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: displayController.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: pokedexState.shownIndex.value?.dexIndex?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                crossAxisCount: count,
              ),
              itemBuilder: (context, index) => DexGridItem(
                  dexEntry: pokedexState.shownIndex.value!.dexIndex![index],
                  onTap: (DexEntry selectedEntry) => onItemTap(selectedEntry)),
            ),
          ),
        ],
      );
    });
  }
}
