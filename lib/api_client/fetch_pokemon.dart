import 'package:poke_team_builder/api_client/poke_api_co.dart';
import 'package:poke_team_builder/data/pokemon_model.dart';


class FetchPokemon extends PokeApi {
  @override
  Future<List<String>> allNames() {
    // TODO: implement allNames
    throw UnimplementedError();
  }

  @override
  Future<PokemonModel> single(int page) async {
    PokemonModel poke;
    final response = await dio.get(super.test);

    poke = PokemonModel.fromJson(response.data);
    return poke;
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonModel>> filterSearch(String? type, String? name, String? ability, int page) {
    // TODO: implement filterSearch
    throw UnimplementedError();
  }

  

}
