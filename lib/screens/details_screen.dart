import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:poke_team_builder/controllers/display_controller/display_controller.dart';
import 'package:poke_team_builder/controllers/navigation_controller/navigation_controller.dart';
import 'package:poke_team_builder/controllers/pokedex_controller/pokedex_controller.dart';
import 'package:poke_team_builder/controllers/search_controller/search_controller.dart';
import 'package:poke_team_builder/controllers/team_controller/team_controller.dart';
import 'package:poke_team_builder/models/pokemon_model.dart';
import 'package:poke_team_builder/widgets/details_screen/bio_details.dart';
import 'package:poke_team_builder/widgets/details_screen/image_details.dart';
import 'package:poke_team_builder/widgets/themed_appbar.dart';

import '../assets.dart';
import '../constants.dart';
import '../widgets/details_screen/poke_type_row.dart';
import '../widgets/name_id_title.dart';
import '../widgets/owned_nav_button.dart';

/// Pokemon DetailScreen info and capture - extends from responsive view
class DetailsScreen extends GetResponsiveView {
  DetailsScreen({super.key});

  final DisplayController displayController = Get.find<DisplayController>();
  final PokedexController pokedexController = Get.find<PokedexController>();
  final NavigationController navigationController = Get.find<NavigationController>();

  // this sreen for the moment doesn't require multiple configs
  // it will if project grows so this is a basis future setup.
  @override
  Widget phone() => _buildMainContent();
  @override
  Widget desktop() => _buildMainContent();
  @override
  Widget tablet() => _buildMainContent();


  GetBuilder<DisplayController> _buildMainContent() {
    return GetBuilder<DisplayController>(builder: (controller) {
      return Scaffold(
        appBar: themedAppBar(actions: false),
        backgroundColor:
            displayController.state.appSwatch.value.primary.withOpacity(0.1),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(Get.context!).size.height),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center vertically
                children: [
                  Expanded(
                    child: _PokemonDataWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SeeCapturedButton(),
      );
    });
  }
}


// main details body
class _PokemonDataWidget extends StatelessWidget {

  final PokedexController pokedexController = Get.find<PokedexController>();
  final NavigationController navigationController = Get.find<NavigationController>();
  final TeamController teamController = Get.find<TeamController>();
  final FilterSearchController searchController = Get.find<FilterSearchController>();
  final DisplayController displayController = Get.find<DisplayController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      PokemonModel? pokemon = pokedexController.state.pokedex.value.firstWhere(
          (element) =>
              element?.id == navigationController.state.shownPokemon.value!.id);
      return Container(
        width: MediaQuery.of(Get.context!).size.width,
        height: MediaQuery.of(Get.context!).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Constants.typeBackgrounds.entries
                      .firstWhere(
                          (element) => element.key == pokemon!.types![0])
                      .value,
                ),
                colorFilter:
                    const ColorFilter.mode(Colors.white38, BlendMode.lighten),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageDetails(imageUrl: pokemon?.sprites?.officialArtwork),
            PokeTypeRow(types: pokemon?.types ?? []),
            NameIdTitle(
              name: pokemon!.name!,
              id: pokemon.id,
            ),
            PokemonBio(
              height: pokemon.height,
              weight: pokemon.weight,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 150),
              child: ElevatedButton(
                  onPressed: () {
                    teamController.addToOwned(
                        navigationController.state.shownPokemon.value!);
                    },
                  child: Text("Add to captured", style: TextStyle(
                        color: displayController.state.appSwatch.value.primary),
                  )),
            )
          ],
        ),
      );
    });
  }
}
