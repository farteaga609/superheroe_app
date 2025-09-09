class SuperheroedetalleResponse {
  final String id;
  final String name;
  final String url;
  final String nombrereal;
  final PowerstatsResponse powerstats;

  SuperheroedetalleResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.nombrereal,
    required this.powerstats,
  });

  factory SuperheroedetalleResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroedetalleResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
      nombrereal: json["biography"]["full-name"],
      powerstats: PowerstatsResponse.fromJson(json["powerstats"]),
    );
  }
}

class PowerstatsResponse  {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  PowerstatsResponse({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory PowerstatsResponse.fromJson(Map<String, dynamic> json) {
    return PowerstatsResponse(
      intelligence: json["intelligence"],
      strength: json["strength"],
      speed: json["speed"],
      durability: json["durability"],
      power: json["power"],
      combat: json["combat"],
    );
  }
}
