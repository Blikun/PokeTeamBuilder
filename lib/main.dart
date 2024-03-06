import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poke_team_builder/controllers/local_data_controller/local_data_controller.dart';
import 'package:poke_team_builder/controllers/team_controller/team_controller.dart';
import 'package:poke_team_builder/api_client/api_client.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/navigation_controller/navigation_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/screens/details_screen.dart';
import 'package:poke_team_builder/screens/owned_screen.dart';
import 'package:poke_team_builder/screens/pokedex_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  await GetStorage.init();
  initializeDependencies();
  runApp(const MyApp());
}


void initializeDependencies() {
  ApiClient apiClient = ApiClient();
  var localDataController = LocalDataController();
  var teamController = TeamController(TeamState(),localDataController);
  var pokedexController = PokedexController(PokedexState(), apiClient);
  var displayController = DisplayController(DisplayState(), teamController.state);
  var navigationController = NavigationController(NavigationState(), pokedexController, teamController);
  var searchFilterController = FilterSearchController(SearchFilterState(),teamController.state,pokedexController.state);

  Get.put(pokedexController);
  Get.put(localDataController);
  Get.put(teamController);
  Get.lazyPut(() => navigationController, fenix: true);
  Get.lazyPut(() => displayController, fenix: true);
  Get.lazyPut(() => searchFilterController, fenix: true);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screen) {
        return GetX<DisplayController>(
          builder: (displayController) {
            NavigationController navigationController =
                Get.find<NavigationController>();
            return GetMaterialApp(
              getPages: [
                GetPage(name: '/PokedexScreen', page: () => PokedexScreen()),
                GetPage(name: '/DetailsScreen', page: () => DetailsScreen()),
                GetPage(name: '/OwnedScreen', page: () => OwnedScreen()),
              ],
              title: 'Poke Team Builder',
              routingCallback: (routing) {
                navigationController.changeActualPage(routing!.current);
                if (routing.isBack == true) {
                  navigationController.changeActualPage(routing.previous);
                }
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: displayController.state.appSwatch.value,
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
