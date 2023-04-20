import 'dart:convert';

import 'package:avitus/infrasurtucture/models/districts.dart';
import 'package:avitus/infrasurtucture/models/provins.dart';

List<Firm> firmFromMap(List list) =>
    List<Firm>.from(list.map((item) => Firm.fromJson(item)));

class Firm {
  int id;
  String key;
  String? name;
  String? image;
  Provins? provins;
  Districts? districts;
  String? accountNumber;
  String? contractNumber;
  String? nfo;
  String? inn;
  String? phone1;
  String? phone2;
  String? phone3;

  Firm({
    required this.id,
    required this.key,
    required this.name,
    required this.image,
    required this.provins,
    required this.districts,
    required this.accountNumber,
    required this.contractNumber,
    required this.nfo,
    required this.inn,
    required this.phone1,
    required this.phone2,
    required this.phone3,
  });

  factory Firm.fromJson(Map<String, dynamic> json) => Firm(
      id: json['value']['id'],
      key: json['key'],
      name: json['value']['name'],
      image: json['value']['image'],
      provins: json['value']['provins'] == null
          ? null
          : Provins.fromJson(json['value']['provins']),
      districts: json['value']['districts'] == null
          ? null
          : Districts.fromJson(json['value']['districts']),
      accountNumber: json['value']['accountNumber'],
      contractNumber: json['value']['contractNumber'],
      nfo: json['value']['nfo'],
      inn: json['value']['inn'],
      phone1: json['value']['phone1'],
      phone2: json['value']['phone2'],
      phone3: json['value']['phone3']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'name': name,
        'image': image,
        'provins': provins?.toJson(),
        'districts': districts?.toJson(),
        'accountNumber': accountNumber,
        'contractNumber': contractNumber,
        'nfo': nfo,
        'inn': inn,
        'phone1': phone1,
        'phone2': phone2,
        'phone3': phone3
      };
}
