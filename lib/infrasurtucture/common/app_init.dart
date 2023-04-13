// Created by Muhammed Tolkinov on 16-September-2022

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //await Firebase.initializeApp();
}
