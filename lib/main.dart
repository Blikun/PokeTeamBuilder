import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

void main() {
  initialize();
  runApp(const MyApp());
}

void initialize() {
  ApiClient apiClient = ApiClient();
  var pokedexController = PokedexController(apiClient, PokedexState());
  var teamController = TeamController(TeamState());

  var displayController = DisplayController(DisplayState());
  var navigationController = NavigationController(
      NavigationState(), pokedexController, teamController);
  var searchFilterController = FilterSearchController(
    state: SearchFilterState(),
    pokedexState: pokedexController.state,
    teamState: teamController.state,
  );

  Get.lazyPut(() => pokedexController, fenix: true);
  Get.lazyPut(() => teamController, fenix: true);
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
