import 'dart:convert';

PokeIndex pokeIndexFromJson(String str) => PokeIndex.fromJson(json.decode(str));

String pokeIndexToJson(PokeIndex data) => json.encode(data.toJson());

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

  factory PokeIndex.fromJson(Map<String, dynamic> json) => PokeIndex(
    count: json["count"],
    dexIndex: json["results"] == null ? [] : List<DexIndex>.from(json["results"]!.map((x) => DexIndex.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "results": dexIndex == null ? [] : List<dynamic>.from(dexIndex!.map((x) => x.toJson())),
  };
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