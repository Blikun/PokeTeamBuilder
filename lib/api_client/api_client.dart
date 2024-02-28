
import 'package:poke_team_builder/data/pokemon_model.dart';


abstract class ApiClient {
  Future<List<String>> allNames();

  Future<PokemonModel> single(int page);

  Future<List<PokemonModel>> filterSearch(
      String? type,
      String? name,
      String? ability,
      int page,);
}
