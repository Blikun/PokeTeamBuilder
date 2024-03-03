
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/widgets/pokedex_screen/PokedexPanel.dart';

import '../widgets/dex_grid.dart';


class PokedexScreen extends GetResponsiveView {
  PokedexScreen({super.key});

  final DisplayController displayController = Get.find<DisplayController>();

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: displayController.state.appSwatch.value.primary,
    );
  }

  Drawer _buildDrawer(double width) {
    return Drawer(
      child: Container(
        width: width,
        color: displayController.state.appSwatch.value.primary,
      ),
    );
  }



  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        displayController.changeSwatch(ColorScheme.fromSwatch(primarySwatch: Colors.blue));
      },
    );
  }

  @override
  Widget phone() {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(350),
      backgroundColor: displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Expanded(child: DexGrid(count: 3)),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  @override
  Widget desktop() {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(350),
      backgroundColor: displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Row(
        children: [
          Expanded(child: DexGrid(count: 10)),
          PokedexPanel(width: 300,)
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  @override
  Widget tablet() {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(400),
      backgroundColor: displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Row(
        children: [
          Expanded(child: DexGrid(count: 6)),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
