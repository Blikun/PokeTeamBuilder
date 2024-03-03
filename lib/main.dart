import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:poke_team_builder/api_client/api_client.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
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
        PokedexController pokedexController =
            PokedexController(apiClient, PokedexState());
        DisplayController displayController = DisplayController(DisplayState());
        SearchFilterController searchFilterController = SearchFilterController(
          state: SearchFilterState(),
          pokedexController: pokedexController,
        );
        Get.lazyPut(() => pokedexController);
        Get.lazyPut(() => displayController);
        Get.lazyPut(() => searchFilterController);
        return GetX<DisplayController>(
          builder: (controller) {
            return GetMaterialApp(
              title: 'Poke Team Builder',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme:  controller.state.appSwatch.value,
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
