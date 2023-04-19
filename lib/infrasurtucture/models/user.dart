List<User> userFromMap(List list) =>
    List<User>.from(list.map((item) => User.fromJson(item)));

class User {
  bool type;
  String keyPass;

  User({required this.type, required this.keyPass});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(type: json['type'], keyPass: json['keyPass']);

  Map<String, dynamic> toJson() => {'type': type, 'keyPass': keyPass};
}
