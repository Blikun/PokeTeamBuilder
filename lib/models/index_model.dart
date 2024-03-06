import '../constants.dart';
import '../utils.dart';
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

  Map<String, dynamic> toJson() {
    return {
      'dexIndex': dexIndex?.map((entry) => entry.toJson()).toList(),
      'ascending': ascending,
    };
  }

  IndexModel copyWith({
    List<DexEntry>? dexIndex,
    required bool ascending,
  }) =>
      IndexModel(
        dexIndex: dexIndex ?? this.dexIndex,
        ascending: ascending,
      );

  /// IndexModel Factory for PokeAPI GraphQl response
  factory IndexModel.fromPokeGQL(Map<String, dynamic> indexData) =>
      IndexModel(
        dexIndex: indexData["pokemon_v2_pokemon"] == null ? [] : List<DexEntry>.from(indexData["pokemon_v2_pokemon"].map((x) => DexEntry.fromPokeApiJson(x))),
      );
}




