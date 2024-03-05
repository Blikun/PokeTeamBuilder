import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/widgets/themed_appbar.dart';


class DetailsScreen extends GetResponsiveView {
  DetailsScreen({super.key});

  final DisplayController displayController = Get.find<DisplayController>();
  final PokedexController pokedexController = Get.find<PokedexController>();



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
      backgroundColor:
          displayController.state.appSwatch.value.primary.withOpacity(0.1),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  @override
  Widget desktop() {
    return Scaffold(
      appBar: themedAppBar(),
      backgroundColor:
          displayController.state.appSwatch.value.primary.withOpacity(0.1),
      body: Center(child: Container(color: Colors.red, width: 300, height: 300,),),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  @override
  Widget tablet() {
    return Scaffold(
      appBar: themedAppBar(),
      backgroundColor:
          displayController.state.appSwatch.value.primary.withOpacity(0.1),

      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
