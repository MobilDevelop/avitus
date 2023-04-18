List<Provins> provinsFromMap(List list) =>
    List<Provins>.from(list.map((item) => Provins.fromJson(item)));

class Provins {
  int? id;
  String? name;

  Provins({required this.id, required this.name});

  factory Provins.fromJson(Map<String, dynamic> json) =>
      Provins(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
