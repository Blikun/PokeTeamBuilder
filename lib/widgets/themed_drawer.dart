import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/widgets/pokedex_screen/types_filter_wrap.dart';
import 'package:poke_team_builder/widgets/themed_button.dart';

/// Drawer for mobile version
Drawer themedDrawer(double width) {
  DisplayController displayController = Get.find<DisplayController>();
  FilterSearchController searchController = Get.find<FilterSearchController>();
  return Drawer(
    width: width,
    elevation: 5,
    child: Container(
      color: displayController.state.appSwatch.value.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Type filter",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
            ),
            TypesFilterWrap(size: 50),
            const Divider(
              endIndent: 50,
              indent: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 5),
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
                padding: const EdgeInsets.only(bottom: 5, top: 5),
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
              )

            ],)
          ],
        ),
      ),
    ),
  );
}