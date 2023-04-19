import 'package:avitus/application/store_info/store_info_cubit.dart';
import 'package:avitus/application/store_info/store_info_state.dart';
import 'package:avitus/infrasurtucture/models/firm_model.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/pages/store_info/components/fab_menu.dart';
import 'package:avitus/presentation/pages/store_info/components/store_info_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreInfoPage extends StatelessWidget {
  const StoreInfoPage({super.key, required this.firm});
  final Firm firm;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreInfoCubit(firm.id.toString()),
      child: BlocListener<StoreInfoCubit, StoreInfoState>(
        listener: (context, state) {},
        child: Builder(builder: (context) {
          final cubit = context.read<StoreInfoCubit>();
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppTheme.colors.primary,
              title: Text(
                firm.name!,
                style: AppTheme.data.textTheme.headline4
                    ?.copyWith(color: AppTheme.colors.secondary),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView.builder(
                      itemCount: cubit.items.length,
                      itemBuilder: (context, index) => StoreInfoListWidget(
                        item: cubit.items[index],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45.h,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: ScreenSize.h4),
                  padding: EdgeInsets.only(left: ScreenSize.w10, right: 75.w),
                  decoration: BoxDecoration(
                      color: AppTheme.colors.primary.withOpacity(0.15),
                      border: Border.all(
                          color: AppTheme.colors.primary, width: 1.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(tr('store.jami_summa'),
                              style: AppTheme.data.textTheme.headline4),
                        ],
                      ),
                      Text("12,5 mln",
                          style: AppTheme.data.textTheme.headline4),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: const FabMenu(),
          );
        }),
      ),
    );
  }
}
