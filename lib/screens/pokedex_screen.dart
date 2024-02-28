import 'package:flutter/material.dart';
import 'package:poke_team_builder/api_client/fetch_pokemon.dart';
import 'package:poke_team_builder/data/pokemon_model.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        print("fetch");
        PokemonModel poke = await FetchPokemon().single(1);
        print(poke);
      }),
    );
  }
}
