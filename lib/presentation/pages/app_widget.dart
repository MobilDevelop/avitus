// Created by Muhammed Tolkinov on 14-October-2022

import 'package:avitus/application/app_manager/app_manager_cubit.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/components/error_view.dart';
import 'package:avitus/presentation/routes/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:requests_inspector/requests_inspector.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.localizationDelegates.add(RefreshLocalizations.delegate);

    return BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
      if (state is AppManagerLoading) {
        return const CircularProgressIndicator();
      } else if (state is AppManagerError) {
        return ErrorView(error: state.error);
      } else {
        return RequestsInspector(
          // enabled: PlatformInfo.isDebugMode,
          showInspectorOn: ShowInspectorOn.LongPress,
          child: MaterialApp.router(
            title: 'AVITUS',
            theme: AppTheme.data,
            themeMode: AppTheme.themeMode,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child ??
                    const Material(
                      color: Colors.white,
                      child: SizedBox(),
                    ),
              );
            },
          ),
        );
      }
    });
  }
}
