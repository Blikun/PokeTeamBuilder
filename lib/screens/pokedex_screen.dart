import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';

import '../widgets/pokedex_grid.dart';


class PokedexScreen extends GetResponsiveView {
  PokedexScreen({super.key});
  final DisplayController displayController = Get.find<DisplayController>();


  @override
  Widget phone(){
    return  Scaffold(
      backgroundColor: Colors.black87,
      body: IndexGrid(count: 3),
      floatingActionButton: FloatingActionButton(onPressed: () async {
      }),
    );
  }

  @override
  Widget desktop(){
    return  Scaffold(
      backgroundColor: Colors.black87,
      body: IndexGrid(count: 10),
      floatingActionButton: FloatingActionButton(onPressed: () async {
      }),
    );
  }

  @override
  Widget tablet(){
    return  Scaffold(
      backgroundColor: Colors.black87,
      body:IndexGrid(count: 6),
      floatingActionButton: FloatingActionButton(onPressed: () async {
      }),
    );
  }

}
