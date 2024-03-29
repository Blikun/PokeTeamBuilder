import '../constants.dart';
import '../utils.dart';

/// Index Entry model with basic pokemon data
class DexEntry {
  final int id;
  final String? name;
  final String? frontDefault;
  final List<PokeType>? types;

  DexEntry({required this.id, this.name, this.frontDefault, this.types});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'frontDefault': frontDefault,
      'types': types?.map((type) => type.toString()).toList(),
    };
  }

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

  Map<String, dynamic> toJsonPrefs() {
    return {
      'id': id,
      'name': name,
      'frontDefault': frontDefault,
      'types': types?.map((type) => Utils().pokeTypeToString(type)).toList(),
    };
  }

  // factory DexEntry from Local data
  factory DexEntry.fromJsonPrefs(Map<String, dynamic> json) {
    return DexEntry(
      id: json['id'],
      name: json['name'],
      frontDefault: json['frontDefault'],
      types: (json['types'] as List).map((type) => Utils().stringToPokeType(type)).toList(),
    );
  }

  // factory DexEntry from PokeAPI GraphQl response
  factory DexEntry.fromPokeApiJson(Map<String, dynamic> json) => DexEntry(
    id: json["id"],
    name: json["name"],
    frontDefault: json["pokemon_v2_pokemonsprites"][0]["sprites"],
    types: (json["pokemon_v2_pokemontypes"] as List).map((type) =>
        Utils().stringToPokeType(type["pokemon_v2_type"]["name"])).toList(),
  );
}