PokeIndex pokeIndexFromPokeGQL(Map<String, dynamic> json) =>
    PokeIndex.fromPokeGQL(json);

class PokeIndex {
  final List<DexIndex>? dexIndex;

  PokeIndex({
    this.dexIndex,
  });

  PokeIndex copyWith({
    int? count,
    List<DexIndex>? dexIndex,
  }) =>
      PokeIndex(
        dexIndex: dexIndex ?? this.dexIndex,
      );

  factory PokeIndex.fromPokeGQL(Map<String, dynamic> indexData) => PokeIndex(
    dexIndex: indexData["pokemon_v2_pokemon"] == null
        ? []
        : List<DexIndex>.from(indexData["pokemon_v2_pokemon"].map((x) => DexIndex.fromJson(x))),
  );
}

class DexIndex {
  final String? name;
  final String? frontDefault;

  DexIndex({
    this.name,
    this.frontDefault,
  });

  DexIndex copyWith({
    String? name,
    String? frontDefault,
  }) =>
      DexIndex(
        name: name ?? this.name,
        frontDefault: frontDefault ?? this.frontDefault,
      );

  factory DexIndex.fromJson(Map<String, dynamic> json) => DexIndex(
        name: json["name"],
        frontDefault: json["pokemon_v2_pokemonsprites"][0]["sprites"],
      );
}
