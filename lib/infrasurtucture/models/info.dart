List<Info> infoFromMap(List list) =>
    List<Info>.from(list.map((item) => Info.fromJson(item)));

class Info {
  int id;
  String name;
  bool type;
  int quantity;
  String paymentType;
  String paymentDate;
  String paymentTime;
  String dateOfNotice;

  Info(
      {required this.id,
      required this.name,
      required this.type,
      required this.quantity,
      required this.paymentType,
      required this.paymentDate,
      required this.paymentTime,
      required this.dateOfNotice});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      quantity: json['quantity'],
      paymentType: json['paymentType'],
      paymentDate: json['paymentDate'],
      paymentTime: json['paymentTime'],
      dateOfNotice: json['dateOfNotice']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'quantity': quantity,
        'paymentType': paymentType,
        'paymentDate': paymentDate,
        'paymentTime': paymentTime,
        'dateOfNotice': dateOfNotice
      };
}
