// Created by Muhammed Tolkinov on 16-September-2022

import 'package:avitus/infrasurtucture/notification_service/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initNotification();
  await Hive.initFlutter();
  await Hive.openBox("Mymemory");
}
