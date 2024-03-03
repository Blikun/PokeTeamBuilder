import '../constants.dart';
import '../utils.dart';

IndexModel pokeIndexFromPokeGQL(Map<String, dynamic> json) =>
    IndexModel.fromPokeGQL(json);

class IndexModel {
  final List<DexEntry>? dexIndex;

  IndexModel({
    this.dexIndex,
  });

  IndexModel copyWith({
    List<DexEntry>? dexIndex,
  }) =>
      IndexModel(
        dexIndex: dexIndex ?? this.dexIndex,
      );

  factory IndexModel.fromPokeGQL(Map<String, dynamic> indexData) => IndexModel(
        dexIndex: indexData["pokemon_v2_pokemon"] == null
            ? []
            : List<DexEntry>.from(indexData["pokemon_v2_pokemon"]
                .map((x) => DexEntry.fromJson(x))),
      );
}

class DexEntry {
  final int id;
  final String? name;
  final String? frontDefault;
  final List<PokeType>? types;

  DexEntry({required this.id, this.name, this.frontDefault, this.types});

  DexEntry copyWith({
    String? name,
    String? frontDefault,
    List<PokeType>? types,
    int? id,
  }) =>
      DexEntry(
          name: name ?? this.name,
          frontDefault: frontDefault ?? this.frontDefault,
          types: types ?? this.types,
          id: id ?? this.id);

  factory DexEntry.fromJson(Map<String, dynamic> json) => DexEntry(
        id: json["id"],
        name: json["name"],
        frontDefault: json["pokemon_v2_pokemonsprites"][0]["sprites"],
        types: (json["pokemon_v2_pokemontypes"] as List)
            .map((type) =>
                Utils().stringToPokeType(type["pokemon_v2_type"]["name"]))
            .toList(),
      );
}
