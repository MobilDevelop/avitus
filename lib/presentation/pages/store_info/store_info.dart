import 'package:avitus/application/store_info/store_info_cubit.dart';
import 'package:avitus/application/store_info/store_info_state.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/assets/theme/app_theme.dart';
import 'package:avitus/presentation/pages/store_info/components/fab_menu.dart';
import 'package:avitus/presentation/pages/store_info/components/store_info_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreInfoPage extends StatelessWidget {
  const StoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreInfoCubit, StoreInfoState>(
      listener: (context, state) {},
      child: Builder(builder: (context) {
        final cubit = context.read<StoreInfoCubit>();
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppTheme.colors.primary,
            title: Text(
              "Umid Auto lizing",
              style: TextStyle(
                  color: AppTheme.colors.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //   height: 50.h,
              //   width: double.maxFinite,
              //   margin: EdgeInsets.only(top: ScreenSize.h4),
              //   color: AppTheme.colors.primary,
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        StoreInfoListWidget(index: index),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: const FabMenu(),
        );
      }),
    );
  }
}
