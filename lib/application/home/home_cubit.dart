// ignore_for_file: unused_field

import 'dart:io';

import 'package:avitus/application/home/home_state.dart';
import 'package:avitus/infrasurtucture/firebase_service/firebase_service.dart';
import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    init();
  }
  final searchController = TextEditingController();

  bool searchShow = false;
  final fb = FirebaseDatabase.instance;
  final auth = FirebaseDatabase.instance.ref("Firm");
  List<Firm> firms = [];

  init() async {
    firms = await RTDBService.loadPostFirm();
    emit(HomeInitial());
  }

  Future<Null> refresh() async {
    init();
  }

  void showSearch() {
    searchShow = !searchShow;
    emit(HomeInitial());
  }
}
