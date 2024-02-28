import 'package:dio/dio.dart';
import 'api_client.dart';

abstract class PokeApi implements ApiClient {
  String namesUrl = "/cards/all";
  String test = "/pokemon/ditto";
  int pageSize = 21;

  final dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2"));
}
