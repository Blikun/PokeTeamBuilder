import 'package:flutter_test/flutter_test.dart';
import 'package:poke_team_builder/api_client/api_client.dart';
import 'package:poke_team_builder/models/generations_model.dart';
import 'package:poke_team_builder/models/index_model.dart';
import 'package:poke_team_builder/models/pokemon_model.dart';

void main() {
  group('App gets expected data', () {
    test('Gen 1 pokemon index reachable', () async {
      IndexModel index = await ApiClient().getIndex(Gen(number: 1, count: 151));
      expect(
        index.dexIndex!.length,
        151,
      );
    });
    test('Generations & counts reachable', () async {
      GenerationsModel gens = await ApiClient().getGamesGenerations();
      int count = await ApiClient().getGenerationCount(1);
      expect(gens.genList!.length >= 8, true);
      expect(count == 151, true);
    });
    test('Pokemon data reachable', () async {
      PokemonModel pokemon = await ApiClient().getSinglePokemon(1);
      expect(pokemon.name, "bulbasaur");
      expect(pokemon.sprites?.officialArtwork == null, false);
      expect(pokemon.sprites?.dreamWorld == null, false);
    });
  });
}
