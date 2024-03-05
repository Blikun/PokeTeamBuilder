import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/widgets/pokedex_screen/pokedex_panel.dart';
import 'package:poke_team_builder/widgets/pokedex_screen/types_filter_wrap.dart';
import 'package:poke_team_builder/widgets/themed_appbar.dart';

import '../widgets/dex_grid.dart';

class PokedexScreen extends GetResponsiveView {
  PokedexScreen({super.key});

  final DisplayController displayController = Get.find<DisplayController>();
  final FilterSearchController searchController =
      Get.find<FilterSearchController>();



  Drawer _buildDrawer(double width) {
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
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        displayController
            .changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.indigo));
      },
    );
  }

  @override
  Widget phone() {
    return Scaffold(
      appBar: themedAppBar(searchbar: true),
      drawer: _buildDrawer(150),
      backgroundColor:
          displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Container(
          color:
              displayController.state.appSwatch.value.primary.withOpacity(0.1),
          child: DexGrid(count: 3)),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  @override
  Widget desktop() {
    return Scaffold(
      appBar: themedAppBar(),
      backgroundColor:
          displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Row(
        children: [
          Expanded(child: DexGrid(count: 9)),
          PokedexPanel(
            width: 300,
          )
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  @override
  Widget tablet() {
    return Scaffold(
      appBar: themedAppBar(),
      backgroundColor:
          displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Row(
        children: [
          Expanded(child: DexGrid(count: 5)),
          PokedexPanel(
            width: 230,
          )
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
