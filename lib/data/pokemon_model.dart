import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

class PokemonModel {
  final List<String>? abilities;
  final List<String>? gameIndices;
  final int? id;
  final List<String>? moves;
  final String? name;
  final int? order;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<String>? types;

  PokemonModel({
    this.abilities,
    this.gameIndices,
    this.id,
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
    int? id,
    List<String>? moves,
    String? name,
    int? order,
    Sprites? sprites,
    List<Stat>? stats,
    List<String>? types,
  }) =>
      PokemonModel(
        abilities: abilities ?? this.abilities,
        gameIndices: gameIndices ?? this.gameIndices,
        id: id ?? this.id,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        order: order ?? this.order,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
      );

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    abilities: json["abilities"] == null ? [] : List<String>.from(json["abilities"].map((element) => element["ability"]["name"])),
    gameIndices: json["game_indices"] == null ? [] : List<String>.from(json["game_indices"].map((element) => element["version"]["name"])),
    id: json["id"],
    moves: json["moves"] == null ? [] : List<String>.from(json["moves"].map((element) => element["move"]["name"])),
    name: json["name"],
    order: json["order"],
    sprites: json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]["other"]),
    stats: json["stats"] == null ? [] : List<Stat>.from(json["stats"].map((element) => Stat.fromJson(element))),
    types: json["types"] == null ? [] : List<String>.from(json["types"].map((element) => element["type"]["name"])),
  );

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

