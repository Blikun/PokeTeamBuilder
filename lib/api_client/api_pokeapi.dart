import 'package:dio/dio.dart';

import '../models/pokemon_index.dart';
import '../models/pokemon_model.dart';
import 'api_interface.dart';

/// [API] implementation for pokeapi.co
class PokeApi implements API {
  final Dio dio;
  final String baseUrl;

  PokeApi(this.dio, {this.baseUrl = "https://pokeapi.co/api/v2/"});

  @override
  Future<PokeIndex> pokeIndex() async {
    try {
      final response = await dio.get("$baseUrl/pokemon?limit=10000&offset=0");
      return pokeIndexFromPokeApi(response.data);
    } catch (e) {
      throw Exception('Failed to fetch Index - $e');
    }
  }

  @override
  Future<PokemonModel> singlePokemon(int id) async {
    try {
      final response = await dio.get("$baseUrl/pokemon/$id");
      return pokemonModelFromPokeApi(response.data);
    } catch (e) {
      throw Exception('Failed to fetch Pokemon - $e');
    }
  }

  @override
  Future<List<PokemonModel>> pokemonListPaginated(
      int limit, int offset, List<String> searchParams) async {
    throw UnimplementedError();
  }
}
