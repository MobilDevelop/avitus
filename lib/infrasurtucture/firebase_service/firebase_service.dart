// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:avitus/infrasurtucture/models/info.dart';
import 'package:avitus/infrasurtucture/models/user.dart';
import 'package:firebase_database/firebase_database.dart';

class RTDBService {
  static final database = FirebaseDatabase.instance.reference();

  static Future<List<Firm>> loadPostFirm() async {
    List items = [];
    Query _query = database.child('all_firm');
    var snapshot = await _query.once();
    Map<String, dynamic> result = snapshot.snapshot.value == null
        ? {}
        : jsonDecode(jsonEncode(snapshot.snapshot.value));

    items = result.entries.map((item) {
      return {'key': item.key, 'value': item.value};
    }).toList();
    return firmFromMap(items);
  }

  static Future<Stream<DatabaseEvent>> storePostFirm(Firm firm) async {
    database.child("all_firm").push().set(firm.toJson());
    return database.onChildAdded;
  }

  static Future<Stream<DatabaseEvent>> storePutFirm(Firm firm) async {
    database.child("all_firm").child(firm.key).update(firm.toJson());
    return database.onChildAdded;
  }

  static Future<List<Info>> loadPostInfo(String name) async {
    List items = [];
    Query _query = database.child('transfers').child(name);
    var snapshot = await _query.once();
    Map<String, dynamic> result = snapshot.snapshot.value == null
        ? {}
        : jsonDecode(jsonEncode(snapshot.snapshot.value));

    items = result.entries.map((item) => item.value).toList();
    return infoFromMap(items);
  }

  static Future<List<Info>> loadPosAlltInfo() async {
    List items = [];
    int price = 0;
    Query _query = database.child('transfers');
    var snapshot = await _query.once();
    List result = snapshot.snapshot.value == null
        ? {}
        : jsonDecode(jsonEncode(snapshot.snapshot.value));
    for (var element in result) {
      items += element.entries.map((item) => item.value).toList();
    }
    return infoFromMap(items);
  }

  static Future<Stream<DatabaseEvent>> storePostInfo(
      Info info, String name) async {
    database.child('transfers').child(name).push().set(info.toJson());
    return database.onChildAdded;
  }

  static Future<List<User>> loadPostUser() async {
    List items = [];
    Query _query = database.child('users');
    var snapshot = await _query.once();
    Map<String, dynamic> result = snapshot.snapshot.value == null
        ? {}
        : jsonDecode(jsonEncode(snapshot.snapshot.value));

    items = result.entries.map((item) {
      return {'key': item.key, 'user': item.value};
    }).toList();
    return userFromMap(items);
  }

  static Future<Stream<DatabaseEvent>> storePostUser(User user) async {
    database.child("users").push().set(user.toJson());
    return database.onChildAdded;
  }

  static Future<Stream<DatabaseEvent>> storePutUse(User user) async {
    database.child("users").child(user.key).update(user.toJson());
    return database.onChildAdded;
  }

  // static deletepost(String name, String kod) {
  //   FirebaseDatabase.instance
  //       .reference()
  //       .child(name)
  //       .orderByChild("kodi")
  //       .equalTo(kod)
  //       .onChildAdded
  //       .listen(
  //     (Event event) {
  //       FirebaseDatabase.instance
  //           .reference()
  //           .child(name)
  //           .child(event.snapshot.key!)
  //           .remove();
  //     },
  //   );
  // }
}
