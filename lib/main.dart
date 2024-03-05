import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_team_builder/api_client/api_client.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/controllers/team_controller/team_controller.dart';
import 'package:poke_team_builder/screens/pokedex_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  initialize();
  runApp(const MyApp());
}

void initialize() {
  ApiClient apiClient = ApiClient();
  PokedexController pokedexController =
      PokedexController(apiClient, PokedexState());
  TeamController teamController =
  TeamController(TeamState());
  DisplayController displayController = DisplayController(DisplayState());
  FilterSearchController searchFilterController = FilterSearchController(
    state: SearchFilterState(),
    pokedexState: pokedexController.state,
  );

  Get.lazyPut(() => pokedexController);
  Get.lazyPut(() => displayController);
  Get.lazyPut(() => searchFilterController);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screen) {
        return GetX<DisplayController>(
          builder: (controller) {
            return GetMaterialApp(
              title: 'Poke Team Builder',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: controller.state.appSwatch.value,
                useMaterial3: true,
              ),
              home: PokedexScreen(),
            );
          },
        );
      },
    );
  }
}
