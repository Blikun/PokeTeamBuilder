import 'package:dio/dio.dart';
import '../data/pokemon_index.dart';
import '../data/pokemon_model.dart';
import 'api_client.dart';

class PokeApi implements ApiClient {
  final Dio dio;
  final String baseUrl;

  PokeApi(this.dio, {this.baseUrl = "https://pokeapi.co/api/v2/"});

  @override
  Future<PokeIndex> getPokemonIndex() async {
    try {
      final response = await dio.get("$baseUrl/pokemon?limit=10000&offset=0");
      return PokeIndex.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch Index - $e');
    }
  }

  @override
  Future<PokemonModel> single(int page) async {
    try {
      final response = await dio.get("$baseUrl/pokemon/$page");
      return PokemonModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch Pokemon - $e');
    }
  }

  @override
  Future<List<PokemonModel>> filterSearch(int page) async {
    throw UnimplementedError();
  }
}
