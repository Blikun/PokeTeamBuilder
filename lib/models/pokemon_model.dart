import 'dart:convert';

import 'package:poke_team_builder/constants.dart';

import '../utils.dart';

PokemonModel pokemonModelFromPokeApi(String jsonString) =>
    PokemonModel.fromPokeApiJson(json.decode(jsonString));

class PokemonModel {
  final List<String>? abilities;
  final List<String>? gameIndices;
  final int id;
  final List<String>? moves;
  final String? name;
  final int? order;
  final int? weight;
  final int? height;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<PokeType>? types;

  PokemonModel({
    this.weight,
    this.height,
    this.abilities,
    this.gameIndices,
    required this.id,
    this.moves,
    this.name,
    this.order,
    this.sprites,
    this.stats,
    this.types,
  });

  PokemonModel copyWith({
    List<String>? abilities,
    List<String>? gameIndices,
    required int id,
    List<String>? moves,
    String? name,
    int? order,
    int? height,
    int? weight,
    Sprites? sprites,
    List<Stat>? stats,
    List<PokeType>? types,
  }) =>
      PokemonModel(
        abilities: abilities ?? this.abilities,
        gameIndices: gameIndices ?? this.gameIndices,
        id: id,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        order: order ?? this.order,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
      );

  factory PokemonModel.fromPokeApiJson(Map<String, dynamic> json) => PokemonModel(
      abilities: json["abilities"] == null
          ? []
          : List<String>.from(
              json["abilities"].map((element) => element["ability"]["name"])),
      gameIndices: json["game_indices"] == null
          ? []
          : List<String>.from(json["game_indices"]
              .map((element) => element["version"]["name"])),
      id: json["id"],
      moves: json["moves"] == null
          ? []
          : List<String>.from(
              json["moves"].map((element) => element["move"]["name"])),
      name: json["name"],
      order: json["order"],
      height: json["height"],
      weight: json["weight"],
      sprites: json["sprites"] == null
          ? null
          : Sprites.fromJson(json["sprites"]["other"]),
      stats: json["stats"] == null
          ? []
          : List<Stat>.from(
              json["stats"].map((element) => Stat.fromJson(element))),
      types: json["types"] == null
          ? []
          : List<PokeType>.from(
              json["types"].map((element) => Utils().stringToPokeType(element["type"]["name"]))));
}

class Sprites {
  final String? dreamWorld;
  final String? officialArtwork;
  final String? showdown;

  Sprites({
    this.dreamWorld,
    this.officialArtwork,
    this.showdown,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        dreamWorld: json["dream_world"]["front_default"],
        officialArtwork: json["official-artwork"]["front_default"],
        showdown: json["showdown"]["front_default"],
      );
}

class Stat {
  final int? baseStat;
  final int? effort;
  final String? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  Stat copyWith({
    int? baseStat,
    int? effort,
    String? stat,
  }) =>
      Stat(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"]["name"],
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat,
      };
}
