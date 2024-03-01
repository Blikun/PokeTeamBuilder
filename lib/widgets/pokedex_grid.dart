import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';

import '../constants.dart';


class CardGrid extends StatelessWidget {
  CardGrid({
    super.key,
  });

  final pokedexController = Get.find<PokedexController>();
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
                itemCount: pokedexController.state.pokedex.value.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return Animate(
                    effects: const [FadeEffect()],
                    child: Image.network(pokedexController.state.pokedex.value[index]!.sprites!.dreamWorld ?? ""),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
