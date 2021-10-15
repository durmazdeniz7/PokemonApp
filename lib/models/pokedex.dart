import 'dart:convert';

Pokedex pokedexFromJson(String str) => Pokedex.fromJson(json.decode(str));

class Pokedex {
  Pokedex({
    required this.pokemon,
  });

  List<Pokemon> pokemon;

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    // required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
    required this.prevEvolution,
  });

  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int? candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  // List<double>? multipliers;
  List<String> weaknesses;
  List<Evolution?> nextEvolution;
  List<Evolution?> prevEvolution;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"],
        egg: json["egg"],
        spawnChance: json["spawn_chance"].toDouble(),
        avgSpawns: json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"],
        // multipliers: json["multipliers"]=List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        nextEvolution: json["next_evolution"] !=null? List<Evolution>.from(
            json["next_evolution"].map((x) => Evolution.fromJson(x))):<Evolution>[Evolution(name: "",num: "")],
        prevEvolution: json["prev_evolution"] !=null? List<Evolution>.from(
            json["prev_evolution"].map((x) => Evolution.fromJson(x))):<Evolution>[Evolution(name: "",num: "")],
      );
}

class Evolution {
  Evolution({
    required this.num,
    required this.name,
  });

  String num;
  String name;

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"] ,
        name: json["name"] ,
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
      };
}
