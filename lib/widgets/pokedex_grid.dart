import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';


import 'dex_grid_item.dart';

class IndexGrid extends StatelessWidget {
  final int count;

  IndexGrid({
    super.key,
    required this.count,
  });

  final displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return GetX<PokedexController>(
      builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                controller: displayController.scrollController,
                padding: const EdgeInsets.all(5),
                itemCount: controller.state.index.value?.dexIndex?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: count,
                ),
                itemBuilder: (context, index) {
                  return DexGridItem(dexEntry: controller.state.index.value!.dexIndex![index],);
                },
              ),
            ),
          ],
        );
      },
    );
  }

}
