import 'package:avitus/application/home/home_cubit.dart';
import 'package:avitus/application/home/home_state.dart';
import 'package:avitus/presentation/assets/asset_index.dart';
import 'package:avitus/presentation/components/laoding.dart';
import 'package:avitus/presentation/pages/home/components/app_bar_search.dart';
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
      if (state is HomeLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppTheme.colors.primary,
            content: Text(
              "salom hammaa",
              textAlign: TextAlign.center,
              style: AppTheme.data.textTheme.headline4
                  ?.copyWith(color: AppTheme.colors.secondary),
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
                        onChaged: (value) => cubit.init(),
                      )
                    : AppBar(
                        elevation: 0,
                        toolbarHeight: 55.h,
                        title: GestureDetector(
                            onLongPress: () {
                              context.push(Routes.users.path);
                            },
                            child: Text(tr('home.bosh_sahifa'))),
                        backgroundColor: AppTheme.colors.primary,
                        actions: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: cubit.showSearch,
                                  icon: SvgPicture.asset(AppIcons.search)),
                              IconButton(
                                  onPressed: () {
                                    context.push(Routes.notification.path);
                                  },
                                  icon:
                                      SvgPicture.asset(AppIcons.notification)),
                            ],
                          )
                        ],
                      ),
                body: cubit.loading
                    ? Loading()
                    : Padding(
                        padding: EdgeInsets.all(ScreenSize.w10),
                        child: RefreshIndicator(
                          onRefresh: cubit.refresh,
                          child: ListView.builder(
                              itemCount: cubit.searchFirms.length,
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    context.push(Routes.storeInfo.path,
                                        extra: cubit.searchFirms[index]);
                                  },
                                  child: ListContainer(
                                      firm: cubit.searchFirms[index]))),
                        ),
                      ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.push(Routes.addStore.path, extra: null);
                  },
                  backgroundColor: AppTheme.colors.primary,
                  child: Icon(Icons.add),
                ),
              ));
    }));
  }
}
