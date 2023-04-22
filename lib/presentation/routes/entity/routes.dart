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
  static const users = Routes._(
    name: 'users_page',
    path: '/users',
  );
  static const secret = Routes._(
    name: 'secret_page',
    path: '/secret',
  );
  static const notification = Routes._(
    name: 'notification_page',
    path: '/notification',
  );
  static const addStore = Routes._(
    name: 'add_store_page',
    path: '/add_store',
  );
  static const storeInfo = Routes._(
    name: 'store_info_page',
    path: '/store_info',
  );

  @override
  String toString() => 'name=$name, path=$path';
}
