import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/navigation_controller/navigation_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/widgets/pokedex_screen/pokedex_panel.dart';
import 'package:poke_team_builder/widgets/themed_appbar.dart';

import '../widgets/captured_button.dart';
import '../widgets/dex_grid.dart';
import '../widgets/themed_drawer.dart';

class PokedexScreen extends GetResponsiveView {
  PokedexScreen({super.key});

  final DisplayController displayController = Get.find<DisplayController>();
  final PokedexController pokedexController = Get.find<PokedexController>();
  final NavigationController navigationController =
  Get.find<NavigationController>();
  final FilterSearchController searchController =
  Get.find<FilterSearchController>();



  @override
  Widget phone() {
    return Scaffold(
      appBar: themedAppBar(searchbar: true),
      endDrawer: themedDrawer(150),
      backgroundColor:
      displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Container(
          color:
          displayController.state.appSwatch.value.primary.withOpacity(0.1),
          child: DexGrid(
            count: 3,
            onItemTap: (selectedPokemonId) {
              navigationController.showDetailsScreen(selectedPokemonId);
            },
          )),
      floatingActionButton: CapturedButton(),
    );
  }

  @override
  Widget desktop() {
    return Scaffold(
      appBar: themedAppBar(actions: true),
      backgroundColor:
      displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Row(
        children: [
          Expanded(
              child:
                DexGrid(
                  count: 9,
                  onItemTap: (selectedPokemonId) {
                    navigationController.showDetailsScreen(selectedPokemonId);
                  },
                )
              ),
          PokedexPanel(
            width: 300,
          )
        ],
      ),
      floatingActionButton:CapturedButton(),
    );
  }

  @override
  Widget tablet() {
    return Scaffold(
      appBar: themedAppBar(actions: true),
      backgroundColor:
      displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Row(
        children: [
          Expanded(
              child: DexGrid(
                count: 5,
                onItemTap: (selectedPokemonId) {
                  navigationController.showDetailsScreen(selectedPokemonId);
                },
              )),
          PokedexPanel(
            width: 230,
          )
        ],
      ),
      floatingActionButton: CapturedButton(),
    );
  }
}
