import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_team_builder/assets.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';

import '../models/dex_entry_model.dart';
import 'dex_grid_item.dart';

/// DexGrid widget GridItems [onTap] return a [DexEntry]
class DexGrid extends StatelessWidget {
  final int count;
  final Function(DexEntry selectedEntry) onItemTap;
  final Function(DexEntry selectedEntry) onItemDelete;
  final bool isRemovable;

  DexGrid(
      {super.key,
      required this.count,
      required this.onItemTap,
      required this.onItemDelete,
      this.isRemovable = false});

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
            child: pokedexState.shownIndex.value?.dexIndex == null
                ? Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 40, child: Lottie.asset(Assets.pokeballAnim)),
                      const SizedBox(width: 10),
                      const Text(
                        "Loading...",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ))
                : pokedexState.shownIndex.value!.dexIndex!.isEmpty == true
                    ? const Center(
                        child: Text(
                        "There is nothing to show!",
                        style: TextStyle(color: Colors.white54),
                      ))
                    : GridView.builder(
                        controller: displayController.scrollController,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        itemCount:
                            pokedexState.shownIndex.value?.dexIndex?.length ??
                                0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          crossAxisCount: count,
                        ),
                        itemBuilder: (context, index) => DexGridItem(
                          isRemovable: isRemovable,
                          dexEntry:
                              pokedexState.shownIndex.value!.dexIndex![index],
                          onTap: (DexEntry selectedEntry) =>
                              onItemTap(selectedEntry),
                          onDelete: (DexEntry selectedEntry) =>
                              onItemDelete(selectedEntry),
                        ),
                      ),
          ),
        ],
      );
    });
  }
}
