import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:graphql/client.dart';
import 'package:poke_team_builder/models/generations_model.dart';

import '../models/index_model.dart';
import '../models/pokemon_model.dart';
import 'api_interface.dart';

/// [API] implementation for pokeapi.co
class PokeApi implements API {
  late final Dio dio;
  late final GraphQLClient graphQLClient;

  PokeApi() {
    graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("https://beta.pokeapi.co/graphql/v1beta"),
    );

    dio = Dio(BaseOptions(
      baseUrl: "https://pokeapi.co/api/v2/",
    ));
  }

  @override
  Future<IndexModel> pokeIndex(Gen gen) async {

    log("asking for gen ${gen.number!} -> getting: ${gen.count} -> skipping: ${gen.offset}");
    try {
      final QueryOptions options = QueryOptions(
        document: gql('''
          query MyQuery {
            pokemon_v2_pokemon(limit: ${gen.count}, offset: ${gen.offset}) {
              name
              id
              pokemon_v2_pokemonsprites {
                sprites(path: "front_default")
              }
              pokemon_v2_pokemontypes {
                pokemon_v2_type {
                  name
                }
              }
            }
          }
            '''),
      );
      final QueryResult result = await graphQLClient.query(options);
      return pokeIndexFromPokeGQL(result.data!);
    } catch (e) {
      throw Exception('Failed to query Index - $e');
    }
  }

  @override
  Future<PokemonModel> singlePokemon(int id) async {
    try {
      final response = await dio.get("/pokemon/$id");
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

  @override
  Future<GenerationsModel> generations() async {
    try {
      final response = await dio.get("/generation/");
      GenerationsModel generations = generationsFromPokeApi(response.data);
      return generations;
    } catch (e) {
      throw Exception('Failed to get gens - $e');
    }
  }

  Future<int> getCountForGeneration(int generationId) async {
    try {
      final response = await dio.get("/generation/$generationId");
      final data = response.data;
      final List<dynamic> pokemonSpecies = data['pokemon_species'];
      log("gen $generationId -> ${pokemonSpecies.length}");
      return pokemonSpecies.length;
    } catch (e) {
      throw Exception(
          'Failed to get Pokemon species count for generation $generationId - $e');
    }
  }
}
