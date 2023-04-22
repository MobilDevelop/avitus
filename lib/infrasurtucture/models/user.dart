List<User> userFromMap(List list) =>
    List<User>.from(list.map((item) => User.fromJson(item)));

class User {
  bool type;
  String key;
  String keyPass;

  User({required this.type, required this.key, required this.keyPass});

  factory User.fromJson(Map<String, dynamic> json) => User(
      type: json['user']['type'],
      key: json['key'],
      keyPass: json['user']['keyPass']);

  Map<String, dynamic> toJson() =>
      {'type': type, 'key': key, 'keyPass': keyPass};
}
