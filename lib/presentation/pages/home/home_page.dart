import 'package:avitus/application/home/home_cubit.dart';
import 'package:avitus/application/home/home_state.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/pages/home/components/app_bar_search.dart';
import 'package:avitus/presentation/pages/home/components/bottom_sheet.dart';
import 'package:avitus/presentation/pages/home/components/list_container.dart';
import 'package:avitus/presentation/routes/index_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(listener: (context, state) {
      if (state is HomeError) {
        print(state.msg);
      }
      if (state is HomeLoaded) {
        print(state.msg);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppTheme.colors.primary,
            content: Text(
              state.msg,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }
    }, child: Builder(builder: (context) {
      final cubit = context.read<HomeCubit>();
      return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => Scaffold(
                backgroundColor: AppTheme.colors.gray,
                appBar: cubit.searchShow
                    ? AppBarSearch(
                        controller: cubit.searchController,
                        ontapBack: () {
                          cubit.showSearch();
                        },
                        ontapClear: () {},
                      )
                    : AppBar(
                        elevation: 0,
                        toolbarHeight: 55.h,
                        title: Text(tr('home.bosh_sahifa')),
                        backgroundColor: AppTheme.colors.primary,
                        actions: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: cubit.showSearch,
                                  icon: SvgPicture.asset(AppIcons.search)),
                              IconButton(
                                  onPressed: () {
                                    BottomShettHome.bottomSheetHome(context);
                                  },
                                  icon: SvgPicture.asset(AppIcons.filter)),
                            ],
                          )
                        ],
                      ),
                body: Padding(
                  padding: EdgeInsets.all(ScreenSize.w10),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            context.push(Routes.storeInfo.path);
                          },
                          child: ListContainer())),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.push(Routes.addStore.path);
                  },
                  backgroundColor: AppTheme.colors.primary,
                  child: Icon(Icons.add),
                ),
              ));
    }));
  }
}
