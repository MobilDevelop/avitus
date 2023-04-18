List<Districts> districtsFromMap(List list) =>
    List<Districts>.from(list.map((item) => Districts.fromJson(item)));

class Districts {
  int? id;
  int? regionId;
  String? name;

  Districts({required this.id, required this.regionId, required this.name});

  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
      id: json["id"], regionId: json['region_id'], name: json["name"]);

  Map<String, dynamic> toJson() =>
      {'id': id, 'region_id': regionId, 'name': name};
}
