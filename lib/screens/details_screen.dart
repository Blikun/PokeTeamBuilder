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
import 'package:poke_team_builder/widgets/themed_appbar.dart';

import '../assets.dart';
import '../constants.dart';
import '../widgets/captured_button.dart';

/// Pokemon DetailScreen info and capture - extends from responsive view
class DetailsScreen extends GetResponsiveView {
  DetailsScreen({super.key});

  final DisplayController displayController = Get.find<DisplayController>();
  final PokedexController pokedexController = Get.find<PokedexController>();

  final NavigationController navigationController =
      Get.find<NavigationController>();

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
        floatingActionButton: CapturedButton(),
      );
    });
  }
}

class _PokemonDataWidget extends StatelessWidget {
  final PokedexController pokedexController = Get.find<PokedexController>();
  final NavigationController navigationController =
      Get.find<NavigationController>();
  final TeamController teamController = Get.find<TeamController>();
  final FilterSearchController searchController =
      Get.find<FilterSearchController>();
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
            _PokemonImage(imageUrl: pokemon?.sprites?.officialArtwork),
            _PokemonTypes(types: pokemon?.types ?? []),
            _PokemonName(
              name: pokemon!.name!,
              id: pokemon.id,
            ),
            _PokemonBio(
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
                  child: Text(
                    "Add to captured",
                    style: TextStyle(
                        color: displayController.state.appSwatch.value.primary),
                  )),
            )
          ],
        ),
      );
    });
  }
}

class _PokemonBio extends StatelessWidget {
  final int? weight;
  final int? height;

  const _PokemonBio({required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weight == null ? "-" : "Weight: $weight",
          style:
              Constants.indexStyle.copyWith(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          height == null ? "-" : "Height: $height",
          style:
              Constants.indexStyle.copyWith(color: Colors.black, fontSize: 20),
        )
      ],
    );
  }
}

class _PokemonImage extends StatelessWidget {
  final String? imageUrl;

  const _PokemonImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return SizedBox(
        height: 300,
        width: 300,
        child: Image.network(
          imageUrl!,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : Center(child: Lottie.asset(Assets.pokeballAnim)),
          errorBuilder: (context, error, stackTrace) =>
              Image.asset(Assets.substitute),
        ).animate(
            effects: [const FadeEffect(duration: Duration(milliseconds: 300))]),
      );
    } else {
      return SizedBox(
        height: 300,
        width: 300,
        child: Padding(
            padding: EdgeInsets.all(90),
            child: Lottie.asset(Assets.pokeballAnim)),
      );
    }
  }
}

class _PokemonTypes extends StatelessWidget {
  final List<PokeType> types;

  const _PokemonTypes({required this.types});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types
          .map((type) => SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(Constants.typeIcons[type] ?? ''),
              ))
          .toList(),
    );
  }
}

class _PokemonName extends StatelessWidget {
  final String name;
  final int id;

  const _PokemonName({required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(children: [
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("#$id  ${name.toUpperCase()}",
                  style: Constants.indexStyle.copyWith(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 18.5
                      ..color = Colors.black,
                  ),
                  maxLines: 1),
            )),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "#$id  ${name.toUpperCase()}",
                style: Constants.indexStyle.copyWith(fontSize: 30),
              ),
            )),
      ]),
    );
  }
}
