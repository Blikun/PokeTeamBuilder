import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:poke_team_builder/api_client/api_client.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/screens/pokedex_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screen) {
        ApiClient apiClient = ApiClient();
        Get.put(PokedexController(apiClient, PokedexState()));
        Get.put(DisplayController(DisplayState()));
        return GetMaterialApp(
          title: 'Poke Team Builder',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: PokedexScreen(),
        );
      },
    );
  }
}
