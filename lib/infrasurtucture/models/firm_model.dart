import 'dart:convert';

import 'package:avitus/infrasurtucture/models/districts.dart';
import 'package:avitus/infrasurtucture/models/provins.dart';

List<Firm> firmFromMap(List list) =>
    List<Firm>.from(list.map((item) => Firm.fromJson(item)));

class Firm {
  int id;
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
      id: json['id'],
      name: json['name'],
      image: json['image'],
      provins:
          json['provins'] == null ? null : Provins.fromJson(json['provins']),
      districts: json['districts'] == null
          ? null
          : Districts.fromJson(json['districts']),
      accountNumber: json['accountNumber'],
      contractNumber: json['contractNumber'],
      nfo: json['nfo'],
      inn: json['inn'],
      phone1: json['phone1'],
      phone2: json['phone2'],
      phone3: json['phone3']);

  Map<String, dynamic> toJson() => {
        'id': id,
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
