// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:firebase_database/firebase_database.dart';

class RTDBService {
  static final database = FirebaseDatabase.instance.reference();
  static String getOperator(String name, int id) {
    // String result = (UssdMalumotlari.choose(id, name));
    return "result";
  }

  static Future<List<Firm>> loadPostFirm() async {
    List items = [];
    Query _query = database.child('all_firm');
    var snapshot = await _query.once();
    Map<String, dynamic> result =
        jsonDecode(jsonEncode(snapshot.snapshot.value));

    items = result.entries.map((item) => item.value).toList();

    return firmFromMap(items);
  }

  static Future<Stream<DatabaseEvent>> storePostFirm(Firm firm) async {
    database.child("all_firm").push().set(firm.toJson());
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
