// Created by Muhammed Tolkinov on 16-September-2022

import 'coordinate.dart';

/// A set of routes for the entire app.
class Routes implements Coordinate {
  const Routes._({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  static const home = Routes._(
    name: 'home_page',
    path: '/home',
  );
  static const addStore = Routes._(
    name: 'add_store_page',
    path: '/add_store',
  );
  static const login = Routes._(
    name: 'login_page',
    path: '/login',
  );

  static const storeInfo = Routes._(
    name: 'store_info_page',
    path: '/store_info',
  );

  @override
  String toString() => 'name=$name, path=$path';
}
