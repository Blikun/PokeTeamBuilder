import 'dart:convert';

PokeIndex pokeIndexFromPokeApi(String jsonString) => PokeIndex.fromPokeApiJson(json.decode(jsonString));

class PokeIndex {
  final int? count;
  final List<DexIndex>? dexIndex;

  PokeIndex({
    this.count,
    this.dexIndex,
  });

  PokeIndex copyWith({
    int? count,
    List<DexIndex>? dexIndex,
  }) =>
      PokeIndex(
        count: count ?? this.count,
        dexIndex: dexIndex ?? this.dexIndex,
      );

  factory PokeIndex.fromPokeApiJson(Map<String, dynamic> json) => PokeIndex(
    count: json["count"],
    dexIndex: json["results"] == null ? [] : List<DexIndex>.from(json["results"]!.map((x) => DexIndex.fromJson(x))),
  );

}

class DexIndex {
  final String? name;
  final String? url;

  DexIndex({
    this.name,
    this.url,
  });

  DexIndex copyWith({
    String? name,
    String? url,
  }) =>
      DexIndex(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory DexIndex.fromJson(Map<String, dynamic> json) => DexIndex(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}