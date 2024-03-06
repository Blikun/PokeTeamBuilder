import 'dex_entry_model.dart';

IndexModel pokeIndexFromPokeGQL(Map<String, dynamic> json) =>
    IndexModel.fromPokeGQL(json);

/// Index model for pokemon indexes
class IndexModel {
  final List<DexEntry>? dexIndex;
  bool ascending;

  IndexModel({
    this.dexIndex,
    this.ascending = false,
  });




  IndexModel copyWith({
    List<DexEntry>? dexIndex,
    required bool ascending,
  }) =>
      IndexModel(
        dexIndex: dexIndex ?? this.dexIndex,
        ascending: ascending,
      );

  // IndexModel toJson
    Map<String, dynamic> toJsonPrefs() {
    return {
      'dexIndex': dexIndex?.map((entry) => entry.toJsonPrefs()).toList(),
      'ascending': ascending,
    };
  }
  // IndexModel Factory from SharedPrefs
  factory IndexModel.fromJsonPrefs(Map<String, dynamic> json) {
    return IndexModel(
      dexIndex: json['dexIndex'] != null
          ? List<DexEntry>.from(json['dexIndex'].map((x) => DexEntry.fromJsonPrefs(x)))
          : [],
      ascending: json['ascending'],
    );
  }

  // IndexModel Factory for PokeAPI GraphQl response
  factory IndexModel.fromPokeGQL(Map<String, dynamic> indexData) =>
      IndexModel(
        dexIndex: indexData["pokemon_v2_pokemon"] == null ? [] : List<DexEntry>.from(indexData["pokemon_v2_pokemon"].map((x) => DexEntry.fromPokeApiJson(x))),
      );
}




