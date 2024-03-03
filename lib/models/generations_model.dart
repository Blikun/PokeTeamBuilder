
GenerationsModel generationsFromPokeApi(Map<String, dynamic> json) => GenerationsModel.fromJson(json);

class GenerationsModel {
  final List<Gen>? gen;

  GenerationsModel({
    this.gen,
  });

  GenerationsModel copyWith({
    List<Gen>? gen,
  }) =>
      GenerationsModel(
        gen: gen ?? this.gen,
      );

  factory GenerationsModel.fromJson(Map<String, dynamic> json) => GenerationsModel(
    gen: json["results"] == null ? [] : List<Gen>.from(json["results"]!.map((x) => Gen.fromJson(x))),
  );

}

class Gen {
  final String? name;
  final String? url;

  Gen({
    this.name,
    this.url,
  });

  Gen copyWith({
    String? name,
    String? url,
  }) =>
      Gen(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Gen.fromJson(Map<String, dynamic> json) => Gen(
    name: json["name"],
    url: json["url"],
  );

}
