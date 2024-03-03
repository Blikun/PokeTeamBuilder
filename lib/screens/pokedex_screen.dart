import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';

import '../widgets/pokedex_grid.dart';


class PokedexScreen extends GetResponsiveView {
  PokedexScreen({super.key});
  final DisplayController displayController = Get.find<DisplayController>();

///todo: securePrefs
  ///
  /// Esta pantalla mostrará la información del Pokémon seleccionado. El diseño es de tu elección, pero necesitamos enseñar todos estos datos:
  ///
  /// Id.
  /// Nombre.
  /// Foto.
  /// Altura y peso (en la unidad que devuelve la API, no es necesario hacer conversiones a centímetros o kilogramos).
  /// Tipos del Pokémon.
  /// Además de todos esos datos, deberemos poder añadir o quitar el Pokémon como capturado. Los Pokémon capturados deben de ser almacenados localmente en el teléfono. La manera en la que almacenes los datos es de tu elección.
  ///

  //todo: meter un topbar
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
      appBar: AppBar(title: const Text('appbar'),),
      backgroundColor: Colors.black87,
      body: IndexGrid(count: 10),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        displayController.changeSwatch(Colors.blue);
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
