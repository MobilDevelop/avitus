// Created by Muhammed Tolkinov on 16-September-2022

import 'package:avitus/infrasurtucture/di/injection_extansion.dart';
import 'package:avitus/infrasurtucture/local_source/local_source.dart';
import 'package:avitus/presentation/pages/add_store/add_store_page.dart';
import 'package:avitus/presentation/pages/home/home_page.dart';
import 'package:avitus/presentation/pages/login/login_page.dart';
import 'package:avitus/presentation/pages/store_info/store_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'entity/pages.dart';
import 'entity/routes.dart';

//final localSource = inject<LocalSource>();

final GoRouter router = GoRouter(
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        name: Routes.login.name,
        path: Routes.login.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        name: Routes.addStore.name,
        path: Routes.addStore.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const AddStore(),
        ),
      ),
      GoRoute(
        name: Routes.storeInfo.name,
        path: Routes.storeInfo.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const StoreInfoPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const SizedBox());

CustomTransitionPage _customTransitionPage({
  required Widget child,
  required ValueKey<String> key,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
