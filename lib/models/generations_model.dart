GenerationsModel generationsFromPokeApi(Map<String, dynamic> json) => GenerationsModel.fromJson(json);

/// Model for Pokemon list of generation / game versions
class GenerationsModel {
  final List<Gen>? genList;

  GenerationsModel({
    this.genList,
  });

  factory GenerationsModel.fromJson(Map<String, dynamic> json) {
    if (json["results"] == null) {
      return GenerationsModel(genList: []);
    }

    var genItems = json["results"]
        .asMap() // as map for having key number to know gen number.
        .entries
        .map((entry) {
      int index = entry.key;
      Map<String, dynamic> item = entry.value;
      return Gen.fromJson(
          item, index + 1); // + 1 because pokemon games gens start at 1.
    }).toList(); // back to a list.


    List<Gen> generations = [];
    for(Gen gen in genItems){
      generations.add(gen);
    }

    return GenerationsModel(genList: generations);
  }
}

class Gen {
  final String? name;
  final String? url;
  final int? number;
  int? count;
  int? offset;

  Gen({
    this.name,
    this.url,
    this.number,
    this.count,
    this.offset,
  });

  factory Gen.fromJson(Map<String, dynamic> json, int number) => Gen(
        name: json["name"],
        url: json["url"],
        number: number,
      );
}
