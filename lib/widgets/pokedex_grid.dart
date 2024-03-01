import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';



class IndexGrid extends StatelessWidget {
  final int count;
  IndexGrid({
    super.key, required this.count,
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
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: count,
                ),
                itemBuilder: (context, index) {
                  return Animate(
                    effects: const [FadeEffect()],
                    child: Image.network(controller.state.index.value!.dexIndex![index].frontDefault ?? ""),
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
